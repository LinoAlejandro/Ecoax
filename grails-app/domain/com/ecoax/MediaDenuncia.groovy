package com.ecoax

class MediaDenuncia {
    String extension
    String path
    String descripcion
    String tipo

    static belongsTo = [ denuncia : Denuncia ]
    static constraints = {
        extension inList:['.jpg', '.png', '.jpeg', '.mp4']
        path size:0..5000
    }
}
