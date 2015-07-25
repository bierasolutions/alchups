
//
//= require jquery
//= require jquery_ujs
//= require_tree .


	function initializeIndex() {
	  	var infowindow = new google.maps.InfoWindow();

	    var mapOptions = map_options(41.89, 0.3179,11);

	    
	    var map = makeMap(mapOptions);

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

	    var mapOptions = map_options(lat,longi,15);

	    var map = makeMap(mapOptions);

	    makeMarker(lat,longi,map);
	}

	function map_options(lati,longi,ZOOM){
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