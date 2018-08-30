$(document).on("turbolinks:load", function() {
  var map = document.getElementById('map')
  var country = map.dataset.country

  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    var geocoder =  new google.maps.Geocoder();
    geocoder.geocode( { 'address': country }, function(results, status) {
      r1 = results[0].geometry.location.lat();
      r2 = results[0].geometry.location.lng();

      markers = handler.addMarkers([{"lat":r1,"lng":r2}]);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
      handler.getMap().setZoom(5);
    });
  });
});