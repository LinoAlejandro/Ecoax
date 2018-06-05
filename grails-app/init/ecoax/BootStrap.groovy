package ecoax
import com.ecoax.User
import com.ecoax.Role
import com.ecoax.UserRole
import com.ecoax.Persona
import com.ecoax.Estatus
import com.ecoax.Dependencia
import com.ecoax.TipoDenuncia

class BootStrap {
    def init = { servletContext ->
        def user = new User(username:'user', password:'user').save()
        def admin = new User(username:'admin', password:'admin').save()
        def encargado1 = new User(username:'encargado1', password:'encargado1').save()
        def encargado2 = new User(username:'encargado2', password:'encargado2').save()
        def encargado3 = new User(username:'encargado3', password:'encargado3').save()

        def roleUser = new Role(authority:'ROLE_USER').save()
        def roleAdmin = new Role(authority:'ROLE_ADMIN').save()
        def roleDependencia = new Role(authority:'ROLE_DEPENDENCIA').save()

        UserRole.create user, roleUser
        UserRole.create admin, roleAdmin
        UserRole.create encargado1, roleDependencia
        UserRole.create encargado2, roleDependencia
        UserRole.create encargado3, roleDependencia

        UserRole.withSession {
          it.flush()
          it.clear()
        }

        def persona = new Persona(username: 'user', password: 'user', confirmPassword:'user', nombre:'lino',
          apPaterno: 'arango', apMaterno:'cruz', email:'lino@correo.com', curp: 'AACL950529HOCRRN02',
          fNacimiento: '29-05-1995', codigoPostal: '71230', ciudad:'Santa Cruz Xoxocotlán', estado:'Oaxaca',
          user: user, privacidad:true).save(flush:true)

        def creada = new Estatus(descripcion:'Creada').save(flush:true)
        def proceso = new Estatus(descripcion:'En proceso').save(flush:true)
        def descartada = new Estatus(descripcion:'Rechazada').save(flush:true)
        def resulta = new Estatus(descripcion:'Resuelta').save(flush:true)

        def dependencia1 = new Dependencia(siglas:'PROFEPA',
        nombre:'Procuraduría Federal de Protección al Ambiente',
        email:'rmarroquin@profepa.gob.mx')

        dependencia1.addToEncargados(encargado1)
        dependencia1.addToEncargados(encargado2)

        dependencia1.save(flush:true)

        def tipo1 = new TipoDenuncia(descripcion:'Forestal', dependencia:dependencia1).save(flush:true)
        def tipo2 = new TipoDenuncia(descripcion:'Tráfico de animales salvajes', dependencia:dependencia1).save(flush:true)

        def dependencia2 = new Dependencia(siglas:'SEDEMA',
        nombre:'Secretaría del Medio Ambiente',
        email:'correo@sedema.gob.mx')

        dependencia2.addToEncargados(encargado3)

        dependencia2.save(flush:true)

        def tipo3 = new TipoDenuncia(descripcion:'Contaminación de suelos', dependencia:dependencia2).save(flush:true)
    }
    def destroy = {
    }
}
