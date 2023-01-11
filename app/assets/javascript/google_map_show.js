//初期マップの設定
let map
//検索後のマップ作成
let geocoder
let Marker

function initMap(){
  geocoder = new google.maps.Geocoder()

  map = new google.maps.Map(document.getElementById('map'), {
    center:  {lat: 35.6803997, lng: 139.7690174},  //東京
    zoom: 16,

  });

  marker = new google.maps.Marker({
    position:  {lat: 35.6803997, lng: 139.7690174 },
    map: map
  });
}
