<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="admin">
    <title>Lista de dependencias</title>
  </head>
  <body>
    <div class="container my-4">
      <div class="row">
        <div class="col display-4 mb-5">
          Lista de dependencias
        </div>
      </div>
      <div class="row">
        <div class="col">
          <table class="table">
            <thead>
              <tr>
                <td>Sigla</td>
                <td>Correo</td>
                <td></td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <g:each in="${dependencias}">
                <tr>
                  <td>${it.siglas}</td>
                  <td>${it.email}</td>
                  <td>
                    <g:link action="delete" params="[id:it.id]">Eliminar</g:link>
                  </td>
                  <td>
                    <g:link action="update" params="[id:it.id]">Actualizar</g:link>
                  </td>
                </tr>
              </g:each>
            </tbody>
          </table>
        </div>
      </div>
      <div class="row">
        <div class="">
          <g:link action="create" class="btn btn-outline-success">Crear nueva dependencia</g:link>
        </div>
      </div>
    </div>
    <style media="screen">
      .paginate a {
        color: black;
        padding-left: 5px;
        padding-right: 5px;
      }
    </style>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col text-center paginate">
          <g:paginate next="Forward" prev="Back"
                    maxsteps="10" controller="dependencia"
                    action="index" total="${dependenciaCount}" class="mx-auto"/>
        </div>
      </div>
    </div>
  </body>
</html>
