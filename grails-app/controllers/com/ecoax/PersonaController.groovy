package com.ecoax
import com.ecoax.Persona
import com.ecoax.User
import com.ecoax.Role
import com.ecoax.UserRole
import grails.plugin.springsecurity.annotation.Secured

class PersonaController {
    def springSecurityService

    @Secured('permitAll')
    def index() { }

    @Secured('permitAll')
    def crear(Persona persona) {
        if(request.method == 'POST') {
            persona.confirmPassword = persona.password
            def user = new User(username: persona.username, password: persona.password)
            persona.user = user
            if(persona.save(flush: true)) {
                def role = Role.findByAuthority('ROLE_USER')
                user.save(flush:true)
                UserRole.create user, role
                UserRole.withSession {
                    it.flush()
                    it.clear()
                }
                flash.message = "Datos almacenados exitosamente, ahora puede entrar al sistema"
                redirect(uri:'/login/auth')
            }
        }
        [persona:persona]
    }

    @Secured('ROLE_USER')
    def modificar() {
        def username = springSecurityService.currentUser.username
        def persona = Persona.findByUsername(username)
        [persona:persona]
    }

    @Secured('ROLE_USER')
    def update(Persona persona) {
        def user = springSecurityService.currentUser
        def personavalidation = Persona.findByUser(user)
        persona.save()
    }
}
