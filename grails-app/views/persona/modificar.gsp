<html><head>
	<meta name="layout" content="default">
	<title>Modificar cuenta</title>
  <asset:stylesheet src="custom/persona/modificar.css" rel="stylesheet" media="screen" />
</head>
<body>
  <div class="container mt-2 px-5">
    <div class="row justify-content-center align-items-center px-5">
      <div class="col-md-4 col-sm-8 pt-3">
        <div class="h1 text-center text-light">
          En este espacio puedes modificar tus datos personales
        </div>
      </div>
    </div>
  </div>
  <div class="container mt-4">
    <div class="row justify-content-center">
      <div class="col text-light rounded login-box">
        <g:form controller="persona" action="save" method="POST">
          <div class="container">
            <div class="row">
              <div class="col-md col-sm-12">
                <div class="form-group">
                  <label for="username" id="username">Username</label>
                  <input class="form-control" type="text" name="username" value="${this.persona?.username}">
                </div>
                <div class="form-group">
                  <label for="password" id="password">Password</label>
                  <input class="form-control" type="password" name="password" value="${this.persona?.password}">
                </div>
                <div class="form-group">
                  <label for="nombre" id="nombre">Nombre(s)</label>
                  <input class="form-control" type="text" name="nombre" value="${this.persona?.nombre}">
                </div>
                <div class="form-group">
                  <label for="apPaterno" id="apPaterno">Apellido Paterno</label>
                  <input class="form-control" type="text" name="apPaterno" value="${this.persona?.apPaterno}">
                </div>
                <div class="form-group">
                  <label for="apMaterno" id="apMaterno">Apellido Materno</label>
                  <input class="form-control" type="text" name="apMaterno" value="${this.persona?.apMaterno}">
                </div>
								<div class="form-group">
                  <label for="email" id="email">Correo electrónico</label>
                  <input class="form-control" type="email" name="email" value="${this.persona?.email}">
                </div>
              </div>
              <div class="col-md-1 d-flex justify-content-center align-items-center">
                <div style="background-color:#99FF5E;height:450px; width:2px;border-radius:2px;" id="hr-custom"></div>
              </div>
              <div class="col-md col-sm-12">
                <div class="form-group">
                  <label for="curp" id="curp">Curp</label>
                  <input class="form-control" type="text" name="curp" value="${this.persona?.curp}">
                </div>
                <div class="form-group">
                  <label for="fNacimiento" id="fNacimiento">Fecha de nacimiento</label>
                  <input class="form-control" type="date" name="fNacimiento" value="${this.persona?.fNacimiento}" >
                </div>
                <div class="form-group">
                  <label for="codigoPostal" id="codigoPostal">Código Postal</label>
                  <input class="form-control" type="number" name="codigoPostal"  value="${this.persona?.codigoPostal}">
                </div>
                <div class="form-group">
                  <label for="ciudad" id="ciudad">Ciudad</label>
                  <input class="form-control" type="text" name="ciudad" value="${this.persona?.ciudad}">
                </div>
                <div class="form-group">
                  <label for="estado" id="estado">Estado</label>
                  <input class="form-control" type="text" name="estado" value="${this.persona?.estado}">
                </div>
                <div class="d-flex justify-content-center my-5">
                  <input class="btn btn-outline-light btn-lg" type="submit" value="Regístrame">
                </div>
              </div>
            </div>
          </div>
        </g:form>
      </div>
    </div>
  </div>
	<div class="container">
			<g:eachError bean="${this.persona}" var="error">
		    <li class="d-block mx-auto text-light text-center">
					<g:if test="${error in org.springframework.validation.FieldError}">
						"${error.field}"
					</g:if><g:message error="${error}"/>
				</li>
		    <script type="text/javascript">
		      var field = document.getElementById('${error.getField()}')
		      field.classList.add('text-danger')
		    </script>
		  </g:eachError>
			<asset:javascript src="custom/persona/modificar.js" />
	</div>
</body>
</html>
