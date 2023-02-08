let map
let Marker

function initMap(){
  const FlowerLocation = { lat: gon.flower.latitude, lng: gon.flower.longitude }

  const map = new google.maps.Map(document.getElementById('map'), {
    center: FlowerLocation,
    zoom: 16,
  })
  const marker = new google.maps.Marker({
    position: FlowerLocation,
    map: map,
    icon: 'https://storage-box24.s3.ap-northeast-1.amazonaws.com/marker.png'
  })
}
