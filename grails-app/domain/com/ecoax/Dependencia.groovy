package com.ecoax

class Dependencia {

    String siglas
    String nombre
    String email

    static hasMany = [ encargados:User, contactosDependencia:ContactoDependencia,
    tipos:TipoDenuncia]

    static constraints = {
        siglas size:2..50
        nombre size:8..500
        email email:true
    }
}
