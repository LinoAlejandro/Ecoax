<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="default">
    <title>Cree una denuncia</title>
    <asset:stylesheet href="custom/form.css"/>
  </head>
  <body>
    <div class="container py-4">
      <div class="text-center display-4">
        Denuncias ciudadanas
      </div>
    </div>
    <div class="container">
      <g:form name="form" action="createAnonima" method="POST">
        <input id="latitud" type="hidden" name="latitud" value="${denuncia?.latitud}">
        <input id="longitud" type="hidden" name="longitud" value="${denuncia?.longitud}">
        <div class="row">
          <div class="col-md-2 py-3 text-center" id="decoration">
              <g:link url="/">
                <asset:image class="img-responsive" width="65px" src="logoLeaf.png"/>
              </g:link>
            <div class="mx-auto mt-3" style="background-color:#99FF5E;height:600px; width:2px;border-radius:2px;" ></div>
          </div>
          <div class="col-md-10">
            <div class="container-fluid">
              <div class="row">
                <div class="col">
                  <div class="form-group">
                    <label for="descripcion">Descripción</label>
                    <input type="text" name="descripcion" value="${denuncia?.descripcion}" class="form-control">
                  </div>
                  <div class="form-group mt-4">
                    <label for="descripcionLarga">Descripción Extensa</label>
                    <textarea type="text" name="descripcionLarga" class="form-control">
                      ${denuncia?.descripcionLarga}
                    </textarea>
                  </div>
                  <div class="form-group mt-4">
                    <label for="fecha">Fecha de la agresión</label>
                    <input id="fecha" type="date" name="fechaSinFormato" value="${denuncia?.fecha ? denuncia.fecha.format('yyyy-MM-dd') : new Date()}" class="form-control">
                    <input id="fechaFormateada" type="hidden" name="fecha" value="">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col mt-3">
                  <label for="">Tipo de denuncia</label>
                  <select name="tipoDenuncia" class="form-control">
                    <g:each in="${tipos}">
                      <option value="${it.descripcion}">
                        ${it.descripcion}
                      </option>
                    </g:each>
                  </select>
                </div>
              </div>
              <div class="row mt-4">
                <div class="col h3">
                  Agregue la localización de la agresión
                </div>
              </div>
              <div class="row">
                <div class="col ">
                  <div id="map" class="w-100" style="height:300px"></div>
                  <script>

                    var markerGlobal

                    function initMap() {
                      var myLatlng = {lat: 17.05845, lng: -96.72745};

                      var map = new google.maps.Map(document.getElementById('map'), {
                        zoom: 12,
                        center: myLatlng
                      });

                      var marker = new google.maps.Marker({
                        position: myLatlng,
                        map: map,
                        title: 'Click to zoom'
                      });

                      markerGlobal = marker

                      google.maps.event.addListener(map,'click',function(event) {
                        var latlng = new google.maps.LatLng(event.latLng.lat(), event.latLng.lng());
                        marker.setPosition(latlng);
                      })

                      var form = document.getElementById('form')
                      var latitud = document.getElementById('latitud')
                      var longitud = document.getElementById('longitud')
                      var fechaFormateada = document.getElementById('fechaFormateada')
                      var fecha = document.getElementById('fecha')

                      function calc(num) {
                          var with2Decimals = num.toString().match(/^-?\d+(?:\.\d{0,5})?/)[0]
                          return with2Decimals
                      }

                      form.addEventListener('submit', function() {
                        latitud.value = calc(markerGlobal.getPosition().lat())
                        longitud.value = calc(markerGlobal.getPosition().lng())
                        fechaFormateada.value = fecha.value + ' 00:00:00.0'
                      })
                    }

                  </script>
                </div>
              </div>
              <div class="row">
                <div class="form-group mt-4">
                  <input type="submit" name="" value="Crear" class="btn btn-outline-success btn-lg">
                </div>
              </div>
            </div>
          </div>
          <script async defer
          src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCGHdmA4knht7hUsn207h_A5yiRNqz_kBs&callback=initMap">
          </script>
        </div>
      </g:form>
    </div>
    <asset:javascript src="custom/form.js" />
    <div class="container">
      <div class="row">
        <div class="col text-light">
          <g:if test="${this.denuncia}">
            <div class="box box-danger">
              <g:eachError bean="${this.denuncia}" var="error">
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
