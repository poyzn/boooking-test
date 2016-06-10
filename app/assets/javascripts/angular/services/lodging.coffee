angular.module('Boooking').factory 'Lodging', [ '$http', ( $http ) ->

  return {
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