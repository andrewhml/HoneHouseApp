function UpdateTableHeaders() {
   $(".persist-area").each(function() {

       var el             = $(this),
           offset         = el.offset(),
           scrollTop      = $(window).scrollTop(),
           floatingHeader = $(".floatingHeader", this);

       if (scrollTop > $('.top-area').height()) {
           floatingHeader.css({
            "visibility": "visible",
            "z-index": "10"
           });
           $('#back_to_top').show(300);
       } else {
           floatingHeader.css({
            "visibility": "hidden"
           });
           $('#back_to_top').hide();
       }

   });
}

// DOM Ready
$(function() {

   var clonedHeaderRow;

   $(".persist-area").each(function() {
       clonedHeaderRow = $(".persist-header", this);
       clonedHeaderRow
         .before(clonedHeaderRow.clone())
         .css("width", clonedHeaderRow.width())
         .addClass("floatingHeader");

   });

   $(window)
    .scroll(UpdateTableHeaders)
    .trigger("scroll");

});
