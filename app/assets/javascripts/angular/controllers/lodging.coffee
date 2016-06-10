angular.module('Boooking').controller 'LodgingCtrl', [ '$scope', '$http', '$stateParams', '$rootScope', 'Lodging', 'Location', 'Auth', ($scope, $http, $stateParams, $rootScope, Lodging, Location, Auth  ) ->

  $scope.place_id = $stateParams.place_id

  $scope.booking = {}

  $scope.init = ->
    if $rootScope.lat && $rootScope.lng
      Lodging.loadLodgingList($rootScope.lat, $rootScope.lng).then (items) ->
        $scope.items = items

  $rootScope.$on 'gotLocation', ->
    Lodging.loadLodgingList($rootScope.lat, $rootScope.lng).then (items) ->
        $scope.items = items

  $scope.getDetails = ->
    Auth.currentUser().then (user) ->
      $scope.authenticated = Auth.isAuthenticated()

    Lodging.loadLodgingInfo($scope.place_id).then (data) ->
      $scope.place_info = data
      $rootScope.$emit 'panMap', { lat: data.lat, lng: data.lng }

  $scope.book = ->
    console.log $scope.booking
    $http.post '/api/v0/bookings/', { booking: $scope.booking }
    .then (data) ->
      console.log data

  $scope.popupOpen = (id) ->
    eval('$scope.popup'+id).opened = true

  $scope.popup1 = {
    opened: false
  }
  $scope.popup2 = {
    opened: false
  }

]