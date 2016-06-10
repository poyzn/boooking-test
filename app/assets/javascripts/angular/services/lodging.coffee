angular.module('Boooking').factory 'Lodging', [ '$http', 'Location', ( $http, Location ) ->

  return {
    lat: null
    lng: null
    list: []
    gatherLocation: ->
      navigator.geolocation.getCurrentPosition(this.gotLocation)
    gotLocation: (position) ->
      this.lat = position.coords.latitude
      this.lng = position.coords.longitude
    loadLodgingInfo: (place_id) ->
      $http.get '/api/v0/hotels/' + place_id
        .then (response) ->
          return response.data
    loadLodgingList: (lat, lng)->
      $http.get '/api/v0/hotels/?lat=' + lat + '&lon=' + lng
        .then (response) ->
          return response.data
  }

]