//初期マップの設定
let map
//検索後のマップ作成
let geocoder
let Marker

function initMap(){
  geocoder = new google.maps.Geocoder()

  map = new google.maps.Map(document.getElementById('map'), {
    center:  {lat: 35.6803997, lng:139.7690174},  //東京
    zoom: 16,

  });
}

function touchAddress(){
  google.maps.event.addListener(map, 'click',
  function(event) {
    if (Marker){Marker.setMap(null)};
    Marker = new google.maps.Marker({
    position: event.latLng,
    draggable: true,
    map: map
    });
    // infotable(Marker.getPosition().lat(),
    // Marker.getPosition().lng(),map.getZoom());
    geocode();
    //マーカードラッグイベントの登録
    google.maps.event.addListener(Marker,'dragend',
    function(event) {
    infotable(Marker.getPosition().lat(),
    Marker.getPosition().lng(),map.getZoom());
    geocode();
    })
    //地図ズームチェンジイベントの登録
    google.maps.event.addListener(map, 'zoom_changed',
    function(event) {
    infotable(Marker.getPosition().lat(),
    Marker.getPosition().lng(),map.getZoom());
    })
  })
  //ジオコーディング
  function geocode(){  var geocoder = new google.maps.Geocoder();
    geocoder.geocode({ 'location': Marker.getPosition()},
      function(results, status) {
    if (status == google.maps.GeocoderStatus.OK && results[0]){
      document.getElementById('flower_address').value = results[0].formatted_address.replace(/^日本, /, '');
      document.getElementById('flower_latitude').value = results[0].geometry.location.lat();
      document.getElementById('flower_longitude').value = results[0].geometry.location.lng();
    }else{
      document.getElementById('flower_address').value =
        "Geocode 取得に失敗しました";
      alert("Geocode 取得に失敗しました reason: "
            + status);
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
