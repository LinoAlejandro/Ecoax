<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="admin">
    <title>Actualizar contacto</title>
  </head>
  <body>
    <div class="container my-4">
      <div class="row">
        <div class="col display-4 mb-5">
          Actualizar contacto
        </div>
      </div>
      <g:form name="name" action="updateContacto" method="POST">
      <input type="hidden" name="id" value="${contacto.id}">
        <div class="row">
          <div class="col">
            <div class="form-group">
              <label for="tipo">tipo</label>
              <select type="text" name="tipo" class="form-control">
                <option value="Número Telefónico">Número Telefónico</option>
                <option value="Facebook">Facebook</option>
                <option value="Twitter">Twitter</option>
                <option value="Instagram">Instagram</option>
                <option value="Correo Electrónico">Correo Electrónico</option>
                <option value="Domicilio">Domicilio</option>
              </select>
            </div>
            <div class="form-group">
              <label for="descripcion">Descripción</label>
              <input type="text" name="descripcion" value="${contacto?.descripcion}" class="form-control">
            </div>
            <div class="form-group">
              <input type="submit" name="" value="Actualizar" class="btn btn-outline-success">
            </div>
          </div>
        </div>
      </g:form>
    </div>
    <g:if test="${this.contacto}">
      <div class="box box-danger">
        <g:eachError bean="${this.contacto}" var="error">
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
  </body>
</html>
