angular.module 'Boooking', ['ui.router', 'templates', 'Devise', 'ui.bootstrap']

angular.module('Boooking').config [ '$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
  $stateProvider
    .state 'list',
      url: ""
      templateUrl: "list.html"
      controller: 'LodgingCtrl'
    .state 'list2',
      url: "/"
      templateUrl: "list.html"
      controller: 'LodgingCtrl'
    .state 'details',
      url: "/lodging/:place_id"
      templateUrl: "details.html"
      controller: 'LodgingCtrl'
]