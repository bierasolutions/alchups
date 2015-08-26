
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
	if($('#home').length){
		homeMap();
	}else if($('#tanksIndex').length){
		initializeIndex();	
	}else{
		initializeShow();	
	}
});
	
	function homeMap(){

		var options = mapOptions(41.8965939,0.3269502,14);
		var map = makeMap(options);
		var infowindow = new google.maps.InfoWindow();

		$('#alchups li').each(function() {
    	var lati = $(this).data("latitude");
    	var longi = $(this).data("longitude");
    	var contentInfo = $(this).html();
  		var marker = makeMarker(lati,longi,map);
    	google.maps.event.addListener(marker, 'click', function() {
    			infowindow.setContent(contentInfo)
     		  infowindow.open(map,marker);
 			});
 		});
    createRoutes(map);
	}

  function createRoute1Path(path, map){
    var polyline = new google.maps.Polyline({
      path: path,
      geodesic: true,
      strokeColor: '#FFF',
      strokeOpacity: 0.7,
      strokeWeight: 5
    });
    polyline.setMap(map); 
  }

  function createRoute2Path(path, map){
    var polyline = new google.maps.Polyline({
      path: path,
      geodesic: true,
      strokeColor: '#FF0000',
      strokeOpacity: 0.7,
      strokeWeight: 5
    });
    polyline.setMap(map); 
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

	  	var place = document.getElementById('description');

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

	function makeMap(mapOptions){
		return new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
	}

	function makeMarker(lati,longi,mapa){
		var marker = new google.maps.Marker({
	    	position: new google.maps.LatLng(lati, longi),
	        map: mapa
	    });

	    return marker;
	}