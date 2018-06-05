<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="admin">
    <title>Crear colaborador</title>
    <asset:stylesheet href="custom/form.css"/>
  </head>
  <body>
    <div class="container py-4">
      <div class="text-center display-4">
        Nuevo colaborador
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
          <g:form action="crearColaborador" class="form">
          <input type="hidden" name="dependenciaId" value="${params.dependenciaId}">
            <div class="form-group">
              <label for="username">Username</label>
              <input type="text" name="username" class="form-control" value="${user?.username}">
            </div>
            <div class="form-group py-3">
              <label for="password">Contraseña</label>
              <input type="password" name="password" class="form-control" id="password">
            </div>
            <div class="form-group">
              <label>Confirmar Contraseña</label>
              <input type="password" class="form-control" id="confirmPassword">
            </div>
            <div class="form-group py-3">
              <input class="btn btn-outline-light btn-md" type="submit" value="Crear nuevo usuario">
            </div>
          </g:form>
        </div>
      </div>
    </div>
    <asset:javascript src="custom/form.js" />
    <div class="container">
      <div class="row">
        <div class="col text-light">
          <g:if test="${this.user}">
            <div class="box box-danger">
              <g:eachError bean="${this.user}" var="error">
                <li class="d-block mx-auto text-center">
                  <g:if test="${error in org.springframework.validation.FieldError}">
                    "${error.field}"
                  </g:if><g:message error="${error}"/>
                </li>
                <script type="text/javascript">
        		      var field = document.getElementById('${error.getField()}')
        		      field.classList.add('border-danger')
      		      </script>
              </g:eachError>
            </div>
          </g:if>
        </div>
      </div>
    </div>
  </body>
</html>
