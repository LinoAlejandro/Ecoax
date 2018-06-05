package com.ecoax
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

@Secured('ROLE_ADMIN')
class DependenciaController {

    def index() {
        if(!params.max) {
            params.max = 10
        }
        [dependencias:Dependencia.list(params), dependenciaCount:Dependencia.count()]
    }

    def create(Dependencia dependencia) {
        if(request.method == 'POST') {
            if(dependencia.save(flush:true)) {
              
                redirect action:'index'
            }
        }
        [dependencia:dependencia]
    }

    def update(Dependencia dependencia) {
        if(request.method == 'POST') {
            dependencia.properties.params
            if(dependencia.save(flush:true)) {
                redirect action:'index'
            }
        }
        [dependencia:dependencia]
    }

    def delete(Dependencia dependencia) {
        dependencia.delete(flush:true)
        redirect action:'index'
    }

    def createContacto(ContactoDependencia contacto) {
        params.dependenciaId = params.dependenciaId
        if(request.method == 'POST') {
            contacto.dependencia = Dependencia.get(params.dependenciaId)
            if(contacto.save(flush:true)) {
                redirect action:'update', params: [id:contacto.dependencia.id]
            }
        }
        [contacto:contacto]
    }

    def updateContacto(ContactoDependencia contacto) {
      if(request.method == 'POST') {
          contacto.properties = params
          if(contacto.save(flush:true)) {
              redirect action:'update', params: [id:contacto.dependencia.id]
          }
      }
      [contacto:contacto]
    }

    def deleteContacto(ContactoDependencia contacto) {
        def dependenciaId = contacto.dependencia.id
        contacto.delete(flush:true)
        redirect action:'update', params:[id:dependenciaId]
    }

    def crearColaborador(User user) {
        params.dependenciaId = params.dependenciaId
        if(request.method == 'POST') {
            if(user.save()) {
                def dependencia = Dependencia.get(params.dependenciaId)
                dependencia.addToEncargados(user)
                dependencia.save(flush:true)
                UserRole.create user, Role.findByAuthority('ROLE_DEPENDENCIA')
                UserRole.withSession {
                    it.flush()
                    it.clear()
                }
                redirect action:'update', params:[id:dependencia.id]
                return
            }
        }
        [user:user]
    }

    def updateColaborador(User user) {
      params.dependenciaId = params.dependenciaId
      if(request.method == 'POST') {
          user.properties = params
          if(user.save(flush:true)) {
              redirect action:'update', params:[id:dependencia.id]
              return
          }
      }
      [user:user]
    }

    def deleteColaborador(User user) {
        def userRole = UserRole.findByUser(user)
        userRole.delete(flush:true)
        user.delete(flush:true)
        redirect action:'update', params:[id:dependencia.id]
    }

    def crearTipo() {
        def tipo = new TipoDenuncia(descripcion:params.descripcion,
        dependencia:Dependencia.get(params.idDependencia))
        if(tipo.save(flush:true)) {
            render tipo as JSON
        } else {
            response.status = 500
        }
    }

    def deleteTipo(TipoDenuncia tipo) {
        def dependencia = tipo.dependencia.id
        tipo.delete(flush:true)
        redirect action:'update', params:[id:dependencia]
    }
}
