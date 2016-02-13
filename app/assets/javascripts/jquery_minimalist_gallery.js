$.fn.minimalistGallery = function(targetImg) {
  this.each(function(){
    var href = $(this).attr('href');
    $(this).on('click', function(){
      $(targetImg).attr('src', href);
      return false;
    });
    $('<img/>')[0].src = href;
  });
};