package com.ecoax

class TipoDenuncia {

    String descripcion

    static belongsTo = [ dependencia:Dependencia ]

    static hasMany = [ denuncias:Denuncia ]

    static constraints = {
        descripcion size:0..1000, unique:true
    }
}
