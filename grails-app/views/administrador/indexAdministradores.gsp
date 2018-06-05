<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="admin">
    <title>Index Solo administradores</title>
  </head>
  <body>
    <div class="container py-4">
      <div class="text-center display-4">
        Lista de administradores
      </div>
    </div>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-12">
          <table class="table">
            <thead>
              <tr>
                <td>Username</td>
              </tr>
            </thead>
            <tbody>
              <g:each var="administrador" in="${admins}">
                <tr>
                  <td>${administrador.username}</td>
                  <td>
                    <g:link action="update" params="[id:administrador.id]">Editar</g:link>
                  </td>
                  <td>
                    <g:link action="delete" params="[id:administrador.id]">Eliminar</g:link>
                  </td>
                </tr>
              </g:each>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </body>
</html>
