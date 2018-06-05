<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="default">
    <title>Cree una denuncia</title>
    <asset:stylesheet href="custom/form.css"/>
  </head>
  <body>
    <g:if test="${flash.message}">
      <div class="container-fluid">
        <div class="alert alert-success" role="alert">
          ${flash.message}
        </div>
      </div>
    </g:if>

    <div class="container py-4">
      <div class="row">
        <div class="col">
          <div class="text-center display-4 mb-5">
            Denuncia ciudadana
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
                  ${denuncia.tipo.descripcion}
                </div>
                <div class="">
                  <label for="" class="text-secondary">Descripción extendida:</label>
                  <div class="">
                    ${denuncia.descripcionLarga}
                  </div>
                </div>
                <div class="mt-1">
                  <button type="button" name="button" class="btn btn-outline-light" onclick="apoyar(${denuncia.id})">
                    Apoyar <span id="badge" class="badge badge-secondary">${denuncia.apoyos.size()}</span>
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>

        <script type="text/javascript">

          function apoyar(id) {
              var span = document.getElementById('badge')
              $.post("${createLink(controller:'denuncia', action: 'apoyar')}/" + id,
              {id:id},
              function(data, status) {
                  if(status == 'success') {
                      span.innerHTML = parseInt(span.innerHTML) + 1
                  }
              })
          }

        </script>
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
    </div>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCGHdmA4knht7hUsn207h_A5yiRNqz_kBs&callback=initMap">
    </script>
    <asset:javascript src="custom/form.js" />
  </body>
</html>
