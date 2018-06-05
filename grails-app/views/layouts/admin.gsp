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
          <g:link action="create" controller="admin" id="" params="" url="" absolute="" base=""></g:link>
          <a class="nav-link" href="/"><span class="custom-navbar-link">Inicio</span></a>
        </li>
        <li class="nav-item dropdown custom-navbar-item">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="custom-navbar-link">Administradores</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <g:link action="indexAdministradores" controller="Administrador" class="dropdown-item">Lista de administradores</g:link>
            <g:link action="create" controller="Administrador" class="dropdown-item">Crear Administrador</g:link>
          </div>
        </li>
        <li class="nav-item dropdown custom-navbar-item">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="custom-navbar-link">Dependencia</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <g:link action="index" controller="Dependencia" class="dropdown-item">Lista de dependencias</g:link>
            <g:link action="create" controller="Dependencia" class="dropdown-item">Crear</g:link>
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
      </ul>
    </div>
  </nav>

  <g:layoutBody />

  <footer class="footer mt-5" style="background-color: #282828;">
      <div class="container px-3 py-2">
        Marca registrada
      </div>
  </footer>
</body>
</html>
