package ecoax
import com.ecoax.User
import com.ecoax.Role
import com.ecoax.UserRole
import com.ecoax.Persona

class BootStrap {

    def init = { servletContext ->
      def user = new User(username:'lino', password:'lino').save()
      def roleUser = new Role(authority:'ROLE_USER').save()
      def roleAdmin = new Role(authority:'ROLE_ADMIN').save()
      def roleDependencia = new Role(authority:'ROLE_DEPENDENCIA').save()

      UserRole.create user, roleUser

      UserRole.withSession {
        it.flush()
        it.clear()
      }

      def persona = new Persona(username: user.username, password:user.password, nombre:'lino',
        apPaterno: 'arango', apMaterno:'cruz', email:'lino@correo.com', curp: 'AACL950529HOCRRN02',
        fNacimiento: '29-05-1995', codigoPostal: '71230', ciudad:'Santa Cruz Xoxocotlán', estado:'Oaxaca',
        user: user, privacidad:true).save(flush:true)

    }
    def destroy = {
    }
}
