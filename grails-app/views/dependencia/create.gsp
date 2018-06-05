<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="admin">
    <title>Crear nueva dependencia</title>
    <asset:stylesheet href="custom/form.css"/>
  </head>
  <body>
    <div class="container py-4">
      <div class="text-center display-4">
        Cree una nueva dependencia
      </div>
    </div>
    <div class="container">
      <g:form name="name" action="create" method="POST">
        <div class="row">
          <div class="col-md-2 py-3 text-center" id="decoration">
              <g:link url="/">
                <asset:image class="img-responsive" width="65px" src="logoLeaf.png"/>
              </g:link>
            <div class="mx-auto mt-3" style="background-color:#99FF5E;height:200px; width:2px;border-radius:2px;" ></div>
          </div>
          <div class="col-md-10">
            <div class="container-fluid">
              <div class="row">
                <div class="col">
                  <div class="form-group">
                    <label for="siglas">Siglas</label>
                    <input type="text" name="siglas" value="${dependencia?.siglas}" class="form-control">
                  </div>
                  <div class="form-group py-3">
                    <label for="nombre">Nombre</label>
                    <input type="text" name="nombre" value="${dependencia?.nombre}" class="form-control">
                  </div>
                  <div class="form-group">
                    <label for="email">Correo de la dependencia</label>
                    <input type="email" name="email" value="${dependencia?.email}" class="form-control">
                  </div>
                  <div class="form-group py-3">
                    <input type="submit" name="" value="Crear" class="btn btn-outline-light btn-md">
                  </div>
                </div>
              </div>
              </div>
            </div>
          </div>
      </g:form>
    </div>
    <asset:javascript src="custom/form.js" />
    <div class="container">
      <div class="row">
        <div class="col text-light">
          <g:if test="${this.dependencia}">
            <div class="box box-danger">
              <g:eachError bean="${this.dependencia}" var="error">
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
