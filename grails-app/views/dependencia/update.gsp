<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="admin">
    <title>Actualizar dependencia</title>
  </head>
  <body>
    <div class="container my-4">
      <div class="row">
        <div class="col display-4 mb-5">
          Actualizar dependencia
        </div>
      </div>
      <g:form name="name" action="update" method="POST">
      <input type="hidden" name="id" value="${dependencia.id}">
      <div class="row">
        <div class="col">
          <div class="form-group">
            <label for="siglas">Siglas</label>
            <input type="text" name="siglas" value="${dependencia?.siglas}" class="form-control">
          </div>
          <div class="form-group">
            <label for="nombre">Nombre</label>
            <input type="text" name="nombre" value="${dependencia?.nombre}" class="form-control">
          </div>
          <div class="form-group">
            <label for="email">Correo de la dependencia</label>
            <input type="email" name="email" value="${dependencia?.email}" class="form-control">
          </div>
          <div class="form-group">
            <input type="submit" name="" value="Actualizar" class="btn btn-outline-success">
          </div>
        </div>
      </div>
      </g:form>
      <div class="row">
        <div class="col h4 mt-4">
          Contactos
        </div>
      </div>
      <div class="row">
        <div class="col">
          <table class="table">
            <thead>
              <tr>
                <td>Tipo</td>
                <td>Descripción</td>
                <td></td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <g:each in="${dependencia.contactosDependencia}">
                <tr>
                  <td>${it.tipo}</td>
                  <td>${it.descripcion}</td>
                  <td>
                    <g:link action="deleteContacto" params="[id:it.id, dependenciaId:dependencia.id]">Eliminar</g:link>
                  </td>
                  <td>
                    <g:link action="updateContacto" params="[id:it.id, dependenciaId:dependencia.id]">Actualizar</g:link>
                  </td>
                </tr>
              </g:each>
            </tbody>
          </table>
        </div>
      </div>
      <div class="row">
        <div class="col">
          <g:link action="createContacto" params="[dependenciaId:dependencia.id]" class="btn btn-outline-success">Crear nuevo contacto</g:link>
        </div>
      </div>
      <div class="row">
        <div class="col h4 mt-5">
          Tipos de denuncia
        </div>
      </div>
      <div class="row mt-4">
        <div class="col">
          <table class="table">
            <thead>
              <tr>
                <td>Descripción</td>
                <td></td>
              </tr>
            </thead>
            <tbody id="tbody">
              <g:each in="${dependencia.tipos}">
                <tr>
                  <td>${it.descripcion}</td>
                  <td>
                    <g:link action="deleteTipo" params="[id:it.id]">Eliminar</g:link>
                  </td>
                </tr>
              </g:each>
            </tbody>
          </table>
        </div>
      </div>
      <div class="row">
        <div class="col">
          <div class="">
            <span class="mr-2">Descripción:</span>
            <input id="tipoDescripcion" type="text" name="" value="" class="mr-2 border border-success rounded">
            <button type="button" name="button" class="btn btn-outline-success" onclick="sendDescripcion()">Agregar tipo</button>
          </div>
        </div>
      </div>
      <script type="text/javascript">
          var descripcion = document.getElementById('tipoDescripcion')
          var tbody = document.getElementById('tbody')
          function sendDescripcion() {
              $.post("${createLink(controller:'dependencia', action: 'crearTipo')}",
              {descripcion:descripcion.value,
              idDependencia:${dependencia.id}},
              function(data, status) {
                  var tr = document.createElement('tr')
                  var td1 = document.createElement('td')
                  var td2 = document.createElement('td')

                  var borrar = document.createElement('a')
                  var actualizar = document.createElement('a')

                  borrar.href = '${request.getContextPath}/deleteTipo/' + data.id

                  borrar.innerHTML = 'Eliminar'

                  td1.innerHTML = data.descripcion

                  td2.appendChild(borrar)

                  tr.appendChild(td1)
                  tr.appendChild(td2)

                  tbody.appendChild(tr)
              })
          }
      </script>
      <div class="row">
        <div class="col h4 mt-4">
          Colaboradores
        </div>
      </div>
      <div class="row mt-4">
        <div class="col">
          <table class="table">
            <thead>
              <tr>
                <td>Nombre de usuario</td>
                <td></td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <g:each in="${dependencia.encargados}">
                <tr>
                  <td>${it.username}</td>
                  <td>
                    <g:link action="deleteColaborador" params="[id:it.id]">Eliminar</g:link>
                  </td>
                  <td>
                    <g:link action="updateColaborador" params="[id:it.id]">Actualizar</g:link>
                  </td>
                </tr>
              </g:each>
            </tbody>
          </table>
        </div>
      </div>
      <div class="row">
        <div class="col">
          <g:link action="crearColaborador" params="[dependenciaId:dependencia.id]" class="btn btn-outline-success">Crear colaborador</g:link>
        </div>
      </div>
    </div>
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
  </body>
</html>
