'use strict'
angular
  .module 'foodTruckApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'firebase',
    'toastr'
  ]
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/food-truck-list.html'
        controller: 'FoodTruckListCtrl'
        controllerAs: 'foodTruckList'
      .when '/product-list',
        templateUrl: 'views/product-list.html'
        controller: 'ProductListCtrl'
        controllerAs: 'productList'
      .otherwise
        redirectTo: '/'

