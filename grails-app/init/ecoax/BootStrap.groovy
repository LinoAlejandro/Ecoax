package ecoax
import com.ecoax.User
import com.ecoax.Role
import com.ecoax.UserRole

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
      
    }
    def destroy = {
    }
}
