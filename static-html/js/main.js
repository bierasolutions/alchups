$( document ).ready(function() {
	
	/**
	CookieBar
	**/
	$.cookieBar({
		message: 'Usamos cookies para poder tener estadísticas de uso de la web.',
		acceptText: 'Acepto',

	});
	
	/**
	Restive
	**/
	$('body').restive({
      breakpoints: ['10000'],
      classes: ['nb'],
      turbo_classes: 'is_mobile=mobi,is_phone=phone,is_tablet=tablet,is_landscape=landscape'
  });
});