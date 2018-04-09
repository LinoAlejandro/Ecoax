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
  def crear() {
    [:]
  }

  @Secured('permitAll')
  def save(Persona persona) {
    def user = new User(username: persona.username, password: persona.password)
    persona.user = user

    if(persona.save(flush: true)) {
      def role = Role.findByAuthority('ROLE_USER')
      user.save(flush:true)

      UserRole.create user, role
      flash.message = "Datos almacenados exitosamente, ahora puede entrar al sistema"
      redirect(uri:'/login/auth')
    } else {
      chain action:'crear', model:[persona:persona]
    }
  }

  @Secured('ROLE_USER')
  def modificar() {
    def username = springSecurityService.currentUser.username
    def persona = Persona.findByUsername(username)
    [persona:persona]
  }

  @Secured('ROLE_USER')
  def update() {
    def user = springSecurityService.currentUser
    def persona = Persona.findByUser(user)
  }
}
