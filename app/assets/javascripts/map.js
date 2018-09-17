$(document).on("turbolinks:load", function() {
  var map = document.getElementById('map')
  var country = map.dataset.country
  var state = map.dataset.state
  var city = map.dataset.city
  var hq = map.dataset.headquarters

  var locations = [hq]

  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    var geocoder =  new google.maps.Geocoder();


  locations.map( function(location) {
      geocoder.geocode( { 'address': location }, function(results, status) {
      r1 = results[0].geometry.location.lat();
      r2 = results[0].geometry.location.lng();

      markers = handler.addMarkers([{"lat":r1,"lng":r2}]);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();

      if (locations.length == 1) {
        handler.getMap().setZoom(10);
      }

    });
  });
  
  

    // geocoder.geocode( { 'address': hq }, function(results, status) {
    //   r1 = results[0].geometry.location.lat();
    //   r2 = results[0].geometry.location.lng();

    //   var myLatLng = {lat: r1, lng: r2};

    //   var map = new google.maps.Map(document.getElementById('map'), {
    //     zoom: 15,
    //     center: myLatLng,
    //     mapTypeId: google.maps.MapTypeId.SATELLITE
    //   });


    //   var marker = new google.maps.Marker({
    //     position: myLatLng,
    //     map: map,
    //     title: 'Headquarters',
    //     icon: {
    //       labelOrigin: new google.maps.Point(16,64),
    //       url: "https://drive.google.com/uc?id=0B3RD6FDNxXbdVXRhZHFnV2xaS1E"
    //     },
    //     label: {
    //       text: "Headquarters",
    //       color: "white",
    //       fontWeight: "bold",
    //       fontSize: "20px"
    //     }
    //   });

    // });

  });
});

