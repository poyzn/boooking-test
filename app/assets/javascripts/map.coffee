#Map = {
#  map: null,
#  loadMap: (lat, lon) ->
#    this.map = new google.maps.Map document.getElementById('map'), {
#      center: {
#        lat: lat,
#        lng: lon
#      },
#      zoom: 14
#    }
#}
#
#
#UserLocation = {
#  lat: null,
#  lon: null,
#  geoSuccess: (position) ->
#    this.lat = position.coords.latitude
#    this.lon = position.coords.longitude
#    Map.loadMap lat, lon
#  get: ->
#    navigator.geolocation.getCurrentPosition(this.geoSuccess)
#}
#
#
#$(document).on 'ready', ->
#  UserLocation.get()
