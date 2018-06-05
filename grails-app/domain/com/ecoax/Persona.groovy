package com.ecoax

class Persona {

    String username
    String password
    String confirmPassword
    String nombre
    String apPaterno
    String apMaterno
    String email
    String curp
    String fNacimiento
    String codigoPostal
    String ciudad
    String estado

    static hasMany = [apoyos:Apoyo, denuncias:Denuncia]

    static belongsTo = [user:User]

    static constraints = {
        username size:2..200
        password validater: { val, obj ->
            obj.confirmPassword == val
        }
        nombre size:2..200
        apPaterno size:3..200
        apMaterno size:3..200
        email email:true
        curp matches:'^[A-Z]{4}[0-9]{6}[\\w]{8}$'
        codigoPostal matches:"[0-9]{5}", size:5..5
        ciudad size:5..300
        estado size:5..300
    }
}
