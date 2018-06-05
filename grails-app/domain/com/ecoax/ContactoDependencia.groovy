package com.ecoax

class ContactoDependencia {

    String descripcion
    String tipo

    static belongsTo = [ dependencia:Dependencia ]

    static constraints = {
        descripcion size:5..400
        tipo inList:['Número Telefónico', 'Facebook', 'Twitter', 'Instagram',
            'Correo Electrónico', 'Domicilio']
    }
}
