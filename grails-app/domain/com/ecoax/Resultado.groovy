package com.ecoax

class Resultado {
    String extension
    String descripcion
    String path

    static belongsTo = [ denuncia : Denuncia ]
    static constraints = {
        extension inList:['.jpg', '.png', '.jpeg', '.mp4']
        descripcion size:0..4500, nullable:true, blank:true
        path size:0..5000
    }
}
