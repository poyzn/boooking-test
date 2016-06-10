angular.module('Boooking').controller 'MapCtrl', [ '$scope', '$http', '$state', 'Lodging', '$rootScope',  ($scope, $http, $state, Lodging, $rootScope ) ->

  $scope.lat = 51.623896
  $scope.lon = 0
  $scope.map = null
  $scope.markers = []

  $rootScope.$on 'gotLocation', ->
    $scope.lat = $rootScope.lat
    $scope.lon = $rootScope.lng
    $scope.loadMap()
    $scope.loadLodgings()
    $scope.setMyLocation()

  $rootScope.$on 'panMap', (event, data) ->
    if $scope.map
      $scope.map.panTo data

  $scope.loadMap = ->
    $scope.map = new google.maps.Map document.getElementById('map'), {
      center: {
        lat: $scope.lat,
        lng: $scope.lng,
      },
      disableDoubleClickZoom: true,
      zoom: 14
    }
    $scope.map.addListener 'dblclick', (e) ->
      $rootScope.lat = e.latLng.lat()
      $scope.lat = e.latLng.lat()
      $rootScope.lng = e.latLng.lng()
      $scope.lon = e.latLng.lng()
      $scope.map.panTo(e.latLng)
      $scope.removeCurrentMarkers()
      $scope.loadLodgings()
      $scope.setMyLocation()
      $rootScope.$emit('updateList')

  $scope.loadLodgings = ->
    Lodging.loadLodgingList($scope.lat, $scope.lng).then (items) ->
      if items.length > 0
        for i in [0..(items.length-1)]
          item = items[i]
          $scope.createMarker item

  $scope.createMarker = (item) ->
    marker = new google.maps.Marker {
      position: { lat: item.lat, lng: item.lng },
      map: $scope.map,
      title: item.name,
      icon: '/images/lodging.png',
      animation: google.maps.Animation.DROP,
      place_id: item.place_id
    }
    marker.addListener 'click', ->
      $state.go 'details', { place_id: item.place_id }
      $scope.map.panTo { lat: item.lat, lng: item.lng }
      console.log item.place_id + ' ' + item.name
    $scope.markers.push marker


  $scope.removeCurrentMarkers = ->
    if $scope.markers && $scope.markers.length > 0
      for i in [0..($scope.markers.length-1)]
        $scope.markers[i].setMap(null)
      $scope.markers = []


  $scope.setMyLocation = ->
    console.log { lat: $scope.lat, lng: $scope.lng }
    $scope.myMarker.setMap(null) if $scope.myMarker
    $scope.myLocation = { lat: $scope.lat, lng: $scope.lng }
    $scope.myMarker = new google.maps.Marker {
      position: $scope.myLocation,
      map: $scope.map,
      title: 'My location',
      icon: '/images/pin.png',
      animation: google.maps.Animation.DROP
    }



]