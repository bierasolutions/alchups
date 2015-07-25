
//
//= require jquery
//= require jquery_ujs
//= require_tree .


	function initializeIndex() {
	  	var infowindow = new google.maps.InfoWindow();

	    var posicion = new google.maps.LatLng(41.89, 0.3179)

	    var mapOptions = {
	      center: posicion,
	      zoom: 11,
	      mapTypeId: google.maps.MapTypeId.SATELLITE
	    };

	    var map = new google.maps.Map(document.getElementById('map-canvas'),
	        mapOptions);

	    $('#alchups').find('tr').each(function() {
	    	var lati = $(this).data("latitude");
	    	var longi = $(this).data("longitude");
	    	var iden = $(this).data("iden");
	    	var title = $(this).data("title");
	    	var contentInfo = '<a href="/tanks/'+ iden +'">'+ title +'</a>';
			
    		var marker = new google.maps.Marker({
	    	  position: new google.maps.LatLng(lati, longi),
	    	  map: map,
	    	  title: 'soy un alchup'
	    	});

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

	    var posicion = new google.maps.LatLng(lat, longi)

	    var mapOptions = {
	      center: posicion,
	      zoom: 15,
	      mapTypeId: google.maps.MapTypeId.SATELLITE
	    };

	    var map = new google.maps.Map(document.getElementById('map-canvas'),
	        mapOptions);

	    var marker = new google.maps.Marker({
	    position: posicion,
	    map: map
	    });
	}