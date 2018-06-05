package com.ecoax
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

class DenunciaController {

    def springSecurityService

    @Secured('ROLE_USER')
    def index() {
        if(!params.max) {
            params.max = 10
        }
        def persona = Persona.findByUser(springSecurityService.currentUser)
        def denuncias = Denuncia.where {
            persona.id == persona.id
        }.list(params)
        [denuncias:denuncias, denunciasCount:denuncias.size()]
    }

    @Secured('permitAll')
    def create(Denuncia denuncia) {
        if(!springSecurityService.currentUser) {
            redirect action:'createAnonima'
            return
        }
        if(request.method == 'POST') {
            denuncia.estatus = Estatus.findByDescripcion('Creada')
            denuncia.tipo = TipoDenuncia.findByDescripcion(params.tipoDenuncia)
            denuncia.demandante = Persona.findByUser(springSecurityService.currentUser)
            if(denuncia.validate()) {
                session.paramsDenuncia = params
                redirect action: "checkForSimilarities"
            }
        }
        [denuncia:denuncia, tipos:TipoDenuncia.findAll()]
    }

    @Secured('permitAll')
    def checkForSimilarities() {
        def denuncia = new Denuncia(session.paramsDenuncia)
        def resultados = Denuncia.createCriteria()
        def tipo = TipoDenuncia.findByDescripcion(session.paramsDenuncia.tipoDenuncia)

        def lista = resultados.list {
            between('latitud', denuncia.latitud - 0.03, denuncia.latitud + 0.03)
            and {
                between('longitud', denuncia.longitud - 0.03, denuncia.longitud + 0.03)
                eq('tipo', tipo)
            }
            maxResults(10)
        }
        [denuncia:denuncia, denunciasSimilares:lista, tipo:TipoDenuncia.findByDescripcion(session.paramsDenuncia.tipoDenuncia)]
    }

    @Secured('permitAll')
    def save() {
        def denuncia = new Denuncia(session.paramsDenuncia)
        denuncia.estatus = Estatus.findByDescripcion('Creada')
        denuncia.tipo = TipoDenuncia.findByDescripcion(session.paramsDenuncia.tipoDenuncia)
        def user = springSecurityService.currentUser
        if(user) {
            denuncia.demandante = Persona.findByUser(springSecurityService.currentUser)
            denuncia.save(flush:true)
            session.paramsDenuncia = null
            redirect action:'show', params:[id:denuncia.id]
        } else {
            denuncia.save(flush:true)
            denuncia.folio = "folio_" + denuncia.id
            session.paramsDenuncia = null
            flash.message = 'Su folio de seguimiento es el siguiente: ' + denuncia.folio
            redirect action:'show', params:[id:denuncia.id]
        }
    }

    @Secured('permitAll')
    def show(Denuncia denuncia) {
        [denuncia:denuncia]
    }

    @Secured('ROLE_USER')
    def apoyar(Denuncia denuncia) {
        def persona = Persona.findByUser(springSecurityService.currentUser)
        def apoyo = Apoyo.findByDenunciaAndPersona(denuncia, persona)
        if(!apoyo) {
            def newApoyo = new Apoyo(persona:persona, denuncia:denuncia)
            if(newApoyo.save(flush:true)) {
                response.status = 200
                render newApoyo as JSON
            } else {
                response.status = 204
            }
        } else {
            response.status = 204
        }
    }

    @Secured('permitAll')
    def createAnonima(Denuncia denuncia) {
      if(request.method == 'POST') {
          denuncia.estatus = Estatus.findByDescripcion('Creada')
          denuncia.tipo = TipoDenuncia.findByDescripcion(params.tipoDenuncia)
          denuncia.demandante = Persona.findByUser(springSecurityService.currentUser)
          if(denuncia.validate()) {
              session.paramsDenuncia = params
              redirect action: "checkForSimilarities"
          }
      }
      [denuncia:denuncia, tipos:TipoDenuncia.findAll()]
    }
}
