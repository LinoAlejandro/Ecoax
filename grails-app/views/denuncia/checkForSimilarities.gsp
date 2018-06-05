<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="default">
    <title>Cree una denuncia</title>
    <asset:stylesheet href="custom/form.css"/>
  </head>
  <body>
    <div class="container py-4">
      <div class="row">
        <div class="col">
          <div class="text-center display-4">
            Denuncias ciudadanas
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col mt-2">
          <hr class="bg-light">
        </div>
      </div>
      <div class="row mb-4">
        <div class="col h3">
          Lista de denuncias que le pueden interesar
          <div class="h6">
            Puede optar por apoyar una denuncia ciudadana existente, esto en caso de que su
            denuncia ya exista en la plataforma, si este no es su caso puede finalizar el proceso con el botón
            de "crear"
          </div>
          <g:if test="${denunciasSimilares.size() == 0}">
            <div class="h3 text-center text-secondary py-4">
              No hay resultados compatibles
            </div>
          </g:if>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col">
          <div class="container-fluid">
            <div class="row">
              <g:each var="denuncia" in="${denunciasSimilares}">
                <div class="col-md-4">
                  <div class="rounded border border-light p-4">
                    <div class="h4">
                      ${denuncia.descripcion}
                    </div>
                    <hr class="bg-light">
                    <div class="">
                      <div class="">
                        <span class="text-secondary">Fecha:</span>
                        ${denuncia.fecha.format('yyyy-MM-dd')}
                      </div>
                    </div>
                    <div class="">
                      <div class="">
                        <span class="text-secondary">Tipo:</span>
                        ${denuncia.tipo.descripcion}
                      </div>
                    </div>
                    <div class="">
                      <div class="">
                        <span class="text-secondary">Descripción extendida</span>
                        ${denuncia.descripcionLarga}
                      </div>
                    </div>
                    <hr class="bg-light">
                    <div class="">
                      <button type="button" name="button" class="btn btn-outline-light" onclick="apoyar(${denuncia.id})">
                        Apoyar <span id="badge${denuncia.id}" class="badge badge-secondary">${denuncia.apoyos.size()}</span>
                      </button>
                    </div>
                  </div>
                </div>
              </g:each>
            </div>
            <script type="text/javascript">
              function apoyar(id) {
                  var span = document.getElementById('badge' + id)
                  $.post("${createLink(controller:'denuncia', action: 'apoyar')}/" + id,
                  {id:id},
                  function(data, status) {
                      if(status == 'success') {
                          span.innerHTML = parseInt(span.innerHTML) + 1
                      } else {
                        location.href = "${createLink(controller:'denuncia', action: 'show')}/" + id
                      }
                  })
              }
            </script>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col">
          <hr class="bg-light">
        </div>
      </div>
      <div class="row text-center">
        <div class="col">
          <div class="h3 mb-3">
            Datos de su denuncia
          </div>
        </div>
      </div>
      <div class="row align-items-center">
        <div class="col-md-6">
          <div class="container">
            <div class="row text-center">
              <div class="col lead">
                <div class="">
                  <label for="" class="text-secondary">Descripción</label>
                  ${denuncia.descripcion}
                </div>
                <div class="">
                  <label for="" class="text-secondary">Fecha</label>
                  ${denuncia.fecha.format('yyyy-MM-dd')}
                </div>
                <div class="">
                  <label for="" class="text-secondary">Tipo</label>
                  ${tipo.descripcion}
                </div>
                <div class="">
                  <label for="" class="text-secondary">Descripción extendida:</label>
                  <div class="">
                    ${denuncia.descripcionLarga}
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div id="map" class="w-100" style="height:250px"></div>
          <script>
            function initMap() {
              var myLatlng = {lat: ${denuncia.latitud}, lng: ${denuncia.longitud}};

              var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 12,
                center: myLatlng
              });

              var marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                title: 'Click to zoom'
              });
            }
          </script>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-md-10 mt-3">
          <g:link action="save" class="btn btn-outline-light btn-lg">
            Crear
          </g:link>
        </div>
      </div>
    </div>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCGHdmA4knht7hUsn207h_A5yiRNqz_kBs&callback=initMap">
    </script>
    <asset:javascript src="custom/form.js" />
  </body>
</html>
