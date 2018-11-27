function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var serviceAddress = document.getElementById('service_address');

    if (serviceAddress) {
      var autocomplete = new google.maps.places.Autocomplete(serviceAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(serviceAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
