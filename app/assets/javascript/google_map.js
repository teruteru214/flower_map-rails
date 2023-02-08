let map
let geocoder
let Marker

function initMap(){
  geocoder = new google.maps.Geocoder()

  map = new google.maps.Map(document.getElementById('map'), {
    center:  {lat: 35.65856, lng:139.745461},
    zoom: 16,
  });
}

function touchAddress(){
  google.maps.event.addListener(map, 'click',
  function(event) {
    if (Marker){Marker.setMap(null)};
    Marker = new google.maps.Marker({
    position: event.latLng,
    map: map,
    icon: 'https://storage-box24.s3.ap-northeast-1.amazonaws.com/marker.png'
    });
    geocode();
  })
  function geocode(){  var geocoder = new google.maps.Geocoder();
    geocoder.geocode({ 'location': Marker.getPosition()},
      function(results, status) {
    if (status == google.maps.GeocoderStatus.OK && results[0]){
      document.getElementById('flower_address').value = results[0].formatted_address.replace(/^日本, /, '');
      document.getElementById('flower_latitude').value = results[0].geometry.location.lat();
      document.getElementById('flower_longitude').value = results[0].geometry.location.lng();
    }
    });
  }
}

function codeAddress(){
  let inputAddress = document.getElementById('address').value;
    geocoder.geocode( { 'address': inputAddress}, function(results, status) {
    if (status == 'OK') {
      map.setCenter(results[0].geometry.location);
    } else {
      alert('該当する結果がありませんでした：' + status);
    }
  });
}
