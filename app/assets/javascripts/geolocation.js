var geolocation = new function() {
  var self = this;

  this.init = function() {
    self.geoButton();
  }

  this.geoButton = function() {
    $('.geolocation-button').on('click', function() {
      console.log(navigator);
      if (navigator.geolocation) {
        // Get the user's current position
        navigator.geolocation.getCurrentPosition(function(position){
          $.post('/popular', { latitude: position.coords.latitude, longitude: position.coords.longitude }, function(data) {
            console.log(data);
            $('body').html(data);
          });
          // console.log("latitude: " + position.coords.latitude + "\nlongitude: " + position.coords.longitude);
          // $('body').append(data);
        });
        // navigator.geolocation.getCurrentPosition(showPosition, showError, optn);
      } else {
        alert('Geolocation is not supported in your browser');
      }
    });
  }
}

jQuery(document).ready(function($){
  geolocation.init();
});