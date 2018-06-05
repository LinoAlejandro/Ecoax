<!doctype html>
<html>
<head>
  <sec:ifNotLoggedIn>
    <meta name="layout" content="default"/>
  </sec:ifNotLoggedIn>
  <sec:ifAnyGranted roles="ROLE_USER">
    <meta name="layout" content="default"/>
  </sec:ifAnyGranted>
  <sec:ifAnyGranted roles="ROLE_ADMIN">
    <meta name="layout" content="admin"/>
  </sec:ifAnyGranted>
  <sec:ifAnyGranted roles="ROLE_DEPENDENCIA">
    <meta name="layout" content="dependencia"/>
  </sec:ifAnyGranted>
  <title>Ecoax</title>
</head>
<body>
  <sec:ifNotLoggedIn>
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
  </sec:ifNotLoggedIn>
</body>
</html>
