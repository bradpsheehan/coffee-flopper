// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$.fn.ready(function() {
  var lat = 10.0000; // change to your value
  var lng = 10.0000; // change to your value
  var bounds = new google.maps.LatLngBounds();
  var map = new google.maps.Map(document.getElementById("map"), { zoom: 5, mapTypeId: google.maps.MapTypeId.ROADMAP, center: new google.maps.LatLng(parseFloat(lat), parseFloat(lng)) });

  var lat_lng = new google.maps.LatLng(parseFloat(point.lat), parseFloat(point.lng));
  var marker = new google.maps.Marker({
    position: lat_lng,
    title: "point"
  });
  marker.setMap(map);
  bounds.extend(lat_lng);
  map.fitBounds(bounds);
});
