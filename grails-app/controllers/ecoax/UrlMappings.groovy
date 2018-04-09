package ecoax

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "/forbidden"(view:"/forbidden")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
