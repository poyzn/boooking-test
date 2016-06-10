angular.module('Boooking').service 'Location', [ '$q', '$window', '$rootScope', ( $q, $window, $rootScope ) ->

  self = this

  self.gatherLocation = ->
    deferred = $q.defer()
    if !$window.navigator.geolocation
      deferred.reject 'Geolocation not supported.'
    else
      $window.navigator.geolocation.getCurrentPosition(
        (position) ->
          deferred.resolve position
        (err) ->
          deferred.reject err
      )
    return deferred.promise

  self.gatherLocation()
    .then (data) ->
      $rootScope.lat = data.coords.latitude
      $rootScope.lng = data.coords.longitude

      $rootScope.$emit 'gotLocation'


]

