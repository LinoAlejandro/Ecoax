<html><head>
	<meta name="layout" content="basic">
	<title>Login</title>
  <asset:stylesheet  src="custom/login/auth.css" rel="stylesheet" media="screen" />
</head>
<body>
	<g:if test="${flash.message}">
		<div class="alert alert-success">
			${flash.message}
		</div>
	</g:if>


  <div class="container mt-5 pt-4">
    <div class="row justify-content-center">
      <div class="col-xl-4 col-lg-6 col-md-6 col-sm-8 justify-content-center rounded pt-5 login-box">
        <div class="display-4 text-center mt-2 text-light">
          Iniciar sesión
        </div>
				<div class="display-4 text-center mt-2 text-light">
					<a href="/">
						<asset:image class="img-thumbnail bg-light rounded-circle" width="75px" src="logoLeaf.png"/>
					</a>
        </div>
        <div class="mx-auto px-2 pb-5 pt-4">
          <form action="/login/authenticate" method="POST" id="loginForm" autocomplete="off">
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <span class="input-group-text text-dark px-3" id="basic-addon1" style="background-color: #99FF5E; border: solid 1px #99FF5E;">
                  <i class="fas fa-user"></i>
                </span>
              </div>
              <input type="text" class="form-control" name="username" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
            </div>
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <span class="input-group-text text-dark px-3" id="basic-addon1" style="background-color: #99FF5E; border: solid 1px #99FF5E;">
                  <i class="fas fa-lock"></i>
                </span>
              </div>
              <input type="text" class="form-control" name="password" placeholder="Password" aria-label="Username" aria-describedby="basic-addon1">
            </div>
            <hr class="bg-light">
            <div class="">
							<a class="d-block btn text-dark btn-md mb-3 custom-input-button">Login<a/>
            </div>
            <div class="">
              <a class="d-block btn text-dark btn-md" style="background-color: #99FF5E;" href="/persona/crear">Crear cuenta<a/>
            </div>
      		</form>
        </div>
      </div>
    </div>
  </div>
	<asset:javascript src="custom/login/auth.js"/>
</body>
</html>
