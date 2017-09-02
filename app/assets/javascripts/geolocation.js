var geolocation = new function() {
  var self = this;

  this.init = function() {
    self.geoButton();
    self.locateGroup();
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

  this.locateGroup = function() {
    $('.geolocation-helper-button').on('click', function(){
      if (navigator.geolocation) {
        // Get the user's current position
        navigator.geolocation.getCurrentPosition(function(position){
          var latitude = position.coords.latitude;
          var longitude = position.coords.longitude;
          var zip, location;

          $.get('https://maps.googleapis.com/maps/api/geocode/json?latlng=' + latitude + ',' + longitude + '&key=AIzaSyAO95UzCT8ES3ElLoXkeYHAzGHy1rVV5ys', function(data){
            var response = data['results'];
            console.log(response);
            zip = response[0].address_components[7].long_name;
            location = response[0].address_components[3].long_name + ', ' + response[0].address_components[5].short_name;
            console.log(location);

            var zipField = $('input[name="group[zip_code]"]');
            $(zipField).append('<input type="hidden" name="latitude" value="' + latitude + '" />');
            $(zipField).append('<input type="hidden" name="longitude" value="' + longitude + '" />');
            $(zipField).append('<input type="hidden" name="location" value="' + location + '" />');
            $('input[name="group[zip_code]"]').val(zip);
          });

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
