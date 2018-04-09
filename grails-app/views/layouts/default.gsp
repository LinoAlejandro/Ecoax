<!doctype html>
<html lang="en" class="no-js">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <title>
      <g:layoutTitle default="Grails"/>
  </title>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>

  <asset:javascript src="bootstrap/jquery-3.3.1.js"/>
  <asset:javascript src="bootstrap/pooper.min.js"/>
  <asset:javascript src="bootstrap/bootstrap.min.js"/>
  <asset:javascript src="fontAwesome/fontawesome-all.js"/>

  <asset:stylesheet  src="bootstrap/bootstrap.css" rel="stylesheet" media="screen" />
  <asset:stylesheet  src="fontAwesome/fa-svg-with-js.css" rel="stylesheet" media="screen" />
  <asset:stylesheet  src="custom/layout/default.css" rel="stylesheet" media="screen" />

  <g:layoutHead />
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark px-5 custom-navbar">
    <a clasS="navbar-brand" href="/">
      <asset:image class="mr-2" width="30px" height="30px" src="logoLeaf.png"/>
      <span class="custom-navbar-link">Ecoax</span>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item custom-navbar-item">
          <a class="nav-link" href="/"><span class="custom-navbar-link">Inicio</span></a>
        </li>
        <li class="nav-item custom-navbar-item">
          <a class="nav-link" href="/"><span class="custom-navbar-link">Crear denuncia</span></a>
        </li>
        <li class="nav-item dropdown custom-navbar-item">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="custom-navbar-link">Denuncias</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="#">Mis denuncias</a>
            <a class="dropdown-item" href="#">Denuncias en México</a>
          </div>
        </li>
        <li class="nav-item dropdown custom-navbar-item">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="custom-navbar-link">Acerca de</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="#">Uso de la plataforma</a>
            <a class="dropdown-item" href="#">Funcionamiento interno de la plataforma</a>
            <a class="dropdown-item" href="#">Otros medios de denuncia</a>
          </div>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <sec:ifLoggedIn>
          <li class="nav-item dropdown custom-navbar-item">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <span class="custom-navbar-link"><sec:loggedInUserInfo field='username'/></span>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="/persona/modificar">Mis datos</a>
              <a class="dropdown-item" href="/logoff">Salir</a>
            </div>
          </li>
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
          <li class="nav-item">
            <a class="nav-link" href="/login/auth">Log in</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/persona/crear">Crear cuenta</a>
          </li>
        </sec:ifNotLoggedIn>
      </ul>
    </div>
  </nav>


    <div class="container mt-5">
      <div class="jumbotron text-light" style="border-bottom: 1px solid black; background-color: #323232;">
        <div class="display-3 d-flex align-items-center">
          <span class="">Bienvenido a ecoax</span>
          <asset:image class="ml-lg-5 ml-md-2 ml-sm-1" width="80px" src="logoLeaf.png"/>
        </div>
        <hr class="bg-light">
        <div class="lead" style="color: #cbffad">
          Plataforma de denuncias ambientales en línea para los habitantes de la república mexicana.
        </div>
      </div>
    </div>

    <div class="container mt-2">
      <div class="row justify-content-center align-items-center">
        <div class="col">
          <p class="display-5 text-center">Las denuncias pueden ser generadas de forma pública o privada</p>
          <p class="lead">
            <a class="d-block btn btn-lg text-dark mx-auto" href="#" style="background-color: rgb(153, 255, 94);">Crear denuncia</a>
          </p>
        </div>
        <div class="col-1 d-flex justify-content-center">
          <div style="background-color:#323232;height:150px; width:2px;border-radius:2px;"></div>
        </div>
        <div class="col">
          <p class="display-5 text-center">Si tiene problemas con la plataforma puede consultar el manual de usuario</p>
          <a class="d-block btn btn-lg text-dark" href="#" style="background-color: rgb(153, 255, 94);">Manual de usuario</a>
        </div>
      </div>
    </div>
    
  <g:layoutBody />

  <footer class="footer mt-5" style="background-color: rgb(50, 50, 50);">
      <div class="container px-3 py-2">
        Marca registrada
      </div>
  </footer>
</body>
</html>
