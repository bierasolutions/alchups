
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
  $('.image-selector a').each(function(){
    var href = $(this).attr('href');
    $(this).on('click', function(){
      $('#header_img').attr('src', href);
      return false;
    });
    $('<img/>')[0].src = href;
  });
});
	
	function homeMap(){
		var options = mapOptions(41.8965939,0.3269502,14);
		var map = makeMap(options);
		var infowindow = new google.maps.InfoWindow();

		$('#alchups li').each(function() {
      var contentInfo = $(this).html();
    	var lati = $(this).data("latitude");
    	var longi = $(this).data("longitude");
      var img_src = $(this).data("img");
  		var marker = makeMarker(lati,longi,map);
      if(img_src){
        var anchor = $(this).find('a');
        var href = anchor.attr('href');
        var name = anchor.html();
          contentInfo = '<a href="'+href+'">'+name+'<br/><img src="'+img_src + '"/></a>';
      }
    	google.maps.event.addListener(marker, 'click', function() {
    			infowindow.setContent('<div style="text-align:center; width: 100%; padding-left:20px;">'+contentInfo+'</div>')
     		  infowindow.open(map,marker);
 			});
 		});
    createRoutes(map);
    createTerm(map);
	}

  function createRoute1Path(path, map){
    var polyline = new google.maps.Polyline({
      path: path,
      geodesic: true,
      strokeColor: '#B2E382',
      strokeOpacity: 0.8,
      strokeWeight: 5
    });
    polyline.setMap(map); 
  }

  function createRoute2Path(path, map){
    var polyline = new google.maps.Polyline({
      path: path,
      geodesic: true,
      strokeColor: '#D4A9EF',
      strokeOpacity: 0.8,
      strokeWeight: 5
    });
    polyline.setMap(map); 
  }

  function createTermPath(path, map){
    var polyline = new google.maps.Polyline({
      path: path,
      strokeColor: '#FFF',
      strokeWeight: 2
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
    createTerm(map);
	}

	function initializeShow() {

	  	var place = document.getElementById('description');

	    var lat = place.dataset.latitude;
	    var longi = place.dataset.longitude;

	    var options = mapOptions(lat,longi,15);

	    var map = makeMap(options);

	    makeMarker(lat,longi,map);
      createTerm(map);
	}

	function mapOptions(lati,longi,ZOOM){
		var posicion = new google.maps.LatLng(lati, longi)

	    var mapOptions = {
	      center: posicion,
	      zoom: ZOOM,
        scrollwheel: false,
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
        map: mapa,
        icon: '/icono-mapa.png'
	    });

	    return marker;
	}