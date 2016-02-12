jQuery(function() {
  $("a[rel~=popover], .has-popover").popover();
  $("a[rel~=tooltip], .has-tooltip").tooltip();
});

// update the active tab on the navbar
$(document).ready(function() {

  // $('body').on('click', 'ul.nav', function(){
  //   var url = window.location;
  //   console.log(url.pathname);
  //   // Will only work if string in href matches with location
  //   // $('ul.nav').parent().removeClass('active');
  //   $('ul.nav a[href="'+ url.pathname +'"]').parent().addClass('active');
  //
  //   // Will also work for relative and absolute hrefs
  //   $('ul.nav a').filter(function() {
  //       return this.href == url;
  //   }).parent().addClass('active');
  // });

});
