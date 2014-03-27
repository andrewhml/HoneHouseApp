$(document).ready(function(){
  var image = $('.thumbnail-img');
  $.each(image, function() {
    $(this).click(function() {
      window.location.pathname = $(this).attr('href');
    });
  });
});
