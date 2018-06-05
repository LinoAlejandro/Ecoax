package com.ecoax
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
class AdministradorController {

    def index() {
    }

    def indexAdministradores() {
        if(!params.max) {
            params.max = '10'
        }
        def roleAdmin = Role.findByAuthority('ROLE_ADMIN')
        def userRoles = UserRole.where{
            role.id == roleAdmin.id
        }.list(params)
        def listaAdmins = []
        userRoles.each {
            listaAdmins.add(it.user)
        }
        [admins:listaAdmins, adminsCount:listaAdmins.size()]
    }

    def create(User user) {
        if(request.method == 'POST') {
            if(user.save()) {
                UserRole.create user, Role.findByAuthority('ROLE_ADMIN')
                UserRole.withSession {
                    it.flush()
                    it.clear()
                }
                redirect action:'indexAdministradores'
                return
            }
        }
        params.autoridad = params.autoridad
        [user:user]
    }

    def update(User user) {
        if(request.method == 'POST') {
            user.properties = params
            if(user.save(flush:true)) {
                redirect action:'indexAdministradores'
                return
            }
        }
        [user:user]
    }

    def delete(User user) {
        def userRole = UserRole.findByUser(user)
        userRole.delete(flush:true)
        user.delete(flush:true)
        redirect action:'indexAdministradores'
    }
}
