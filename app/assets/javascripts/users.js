function initialize() {
  console.log("runs");
  var mapProp = {
    center:new google.maps.LatLng(51.508742,-0.120850),
    zoom:5,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
}
//Main
google.maps.event.addDomListener(window, 'load', initialize);
console.log("runs");
