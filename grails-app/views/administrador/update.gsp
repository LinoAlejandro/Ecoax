<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="admin">
    <title>Actualizar Usuario</title>
    <asset:stylesheet href="custom/form.css"/>
  </head>
  <body>
    <div class="container py-4">
      <div class="text-center display-4">
        Actualizar usuario
      </div>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-md-2 py-3 text-center" id="decoration">
            <g:link url="/">
              <asset:image class="img-responsive" width="65px" src="logoLeaf.png"/>
            </g:link>
          <div class="mx-auto mt-3" style="background-color:#99FF5E;height:250px; width:2px;border-radius:2px;" ></div>
        </div>
        <div class="col-md-10">
          <g:form action="update" class="form" name="form">
            <input type="hidden" name="id" value="${user.id}" />
            <div class="form-group">
              <label for="username">Username</label>
              <input type="text" name="username" class="form-control" value="${user?.username}" />
            </div>
            <div class="form-group py-3">
              <label for="password">Contraseña</label>
              <input id="pass1" type="password" name="password" class="form-control" id="password" />
            </div>
            <div class="form-group">
              <label>Confirmar Contraseña</label>
              <input id="pass2" type="password" class="form-control" id="confirmPassword" />
            </div>
            <div class="form-group mt-5">
              <input class="btn btn-outline-light btn-md" type="submit" value="Actualizar usuario" />
            </div>
          </g:form>
        </div>
      </div>
    </div>
    <script type="text/javascript">
      var form = document.getElementById('form')

      var pass1 = document.getElementById('pass1')
      var pass2 = document.getElementById('pass2')

      form.addEventListener('submit', function() {
          if(pass1.value != pass2.value) {
              return false
          }
      })
    </script>
    <asset:javascript src="custom/form.js" />
    <div class="container">
			<g:eachError bean="${this.user}" var="error">
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
			<asset:javascript src="custom/persona/crear.js" />
  	</div>
  </body>
</html>
