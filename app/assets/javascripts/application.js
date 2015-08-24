
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
	homeMap();
});
	
	function homeMap(){
		var options = mapOptions(41.89, 0.3179,12);
		var map = makeMap(options, 'map-home');

		$('#alchups li').each(function() {
    	var lati = $(this).data("latitude");
    	var longi = $(this).data("longitude");
    	var contentInfo = '';
  		var marker = makeMarker(lati,longi,map);
    	google.maps.event.addListener(marker, 'click', function() {
    			infowindow.setContent(contentInfo)
     		  infowindow.open(map,marker);
 			});
 		});	 

	 	var route1Coordinates = [
	    {lat: 41.93, lng: 0.31},
	    {lat: 41.91, lng: 0.27},
	    {lat: 41.90, lng: 0.32},
	    {lat: 41.94, lng: 0.29}
	  ];
	  var route2Coordinates = [
	    {lat: 41.88, lng: 0.39},
	    {lat: 41.94, lng: 0.35},
	    {lat: 41.90, lng: 0.27},
	    {lat: 41.92, lng: 0.29}
	  ];
	  var route1Path = new google.maps.Polyline({
	    path: route1Coordinates,
	    geodesic: true,
	    strokeColor: '#FFF',
	    strokeOpacity: 0.7,
	    strokeWeight: 5
	  });
	  var route2Path = new google.maps.Polyline({
	    path: route2Coordinates,
	    geodesic: true,
	    strokeColor: '#FF0000',
	    strokeOpacity: 0.7,
	    strokeWeight: 5
	  });
	  route1Path.setMap(map); 
	  route2Path.setMap(map); 
	}
	
	function initializeIndex() {
	  	var infowindow = new google.maps.InfoWindow();

	    var options = mapOptions(41.89, 0.3179,11);

	    
	    var map = makeMap(options);

	    $('#alchups').find('tr').each(function() {
	    	var lati = $(this).data("latitude");
	    	var longi = $(this).data("longitude");
	    	var iden = $(this).data("iden");
	    	var title = $(this).data("title");
	    	var contentInfo = '<a href="/tanks/'+ iden +'">'+ title +'</a>';
			
    		var marker = makeMarker(lati,longi,map);

	    	google.maps.event.addListener(marker, 'click', function() {
	    			infowindow.setContent(contentInfo)
       		  infowindow.open(map,marker);
   			});
    	
 		 });	    
	}

	function initializeShow() {

	  	var place = document.getElementById('descripcion');

	    var lat = place.dataset.latitude;
	    var longi = place.dataset.longitude;

	    var options = mapOptions(lat,longi,15);

	    var map = makeMap(options);

	    makeMarker(lat,longi,map);
	}

	function mapOptions(lati,longi,ZOOM){
		var posicion = new google.maps.LatLng(lati, longi)

	    var mapOptions = {
	      center: posicion,
	      zoom: ZOOM,
	      mapTypeId: google.maps.MapTypeId.SATELLITE
	    };

	    return mapOptions;
	}

	function makeMap(mapOptions, id){
		if(!id){
			id = 'map-canvas';
		}
		return new google.maps.Map(document.getElementById(id), mapOptions);
	}

	function makeMarker(lati,longi,mapa){
		var marker = new google.maps.Marker({
	    	position: new google.maps.LatLng(lati, longi),
	        map: mapa
	    });

	    return marker;
	}