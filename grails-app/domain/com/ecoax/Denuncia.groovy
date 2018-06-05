package com.ecoax

class Denuncia {
    Double longitud
    Double latitud
    Date fecha
    String descripcion
    String descripcionLarga
    String folio

    static hasMany = [ apoyos:Apoyo ]

    static belongsTo = [tipo:TipoDenuncia, estatus:Estatus, demandante: Persona]

    static constraints = {
        demandante nullable:true
        descripcion size:10..550
        descripcionLarga size:10..8000
        folio nullable:true, blank:true, unique:true
    }
}
