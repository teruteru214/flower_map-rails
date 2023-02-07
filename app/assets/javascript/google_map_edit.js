let map
let Marker

function initMap(){
  const FlowerLocation = { lat: gon.flower.latitude, lng: gon.flower.longitude }
  geocoder = new google.maps.Geocoder();

  map = new google.maps.Map(document.getElementById('map'), {
    center: FlowerLocation,
    zoom: 16,
  })
  let marker = new google.maps.Marker({
    position: FlowerLocation,
    map: map,
    icon: 'https://storage-box24.s3.ap-northeast-1.amazonaws.com/marker.png'
  })
}

let geocoder
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

function touchAddress(){
  google.maps.event.addListener(map, 'click',
  function(event) {
    if (Marker){Marker.setMap(null)};
    Marker = new google.maps.Marker({
    position: event.latLng,
    map: map,
    icon: 'https://storage-box24.s3.ap-northeast-1.amazonaws.com/%E5%90%8D%E7%A7%B0%E6%9C%AA%E8%A8%AD%E5%AE%9A+(50+%C3%97+50+px)+(3).png'
    });
    geocode();
  })
  //ジオコーディング
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
