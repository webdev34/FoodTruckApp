
angular.module('foodTruckApp').factory 'dataFactory', ($http, $rootScope, $firebaseObject) ->
  urlBase = 'https://food-truck-app.firebaseio.com/0/'
  dataFactory = {}

  dataFactory.getList = (list)->
    ref = new Firebase(urlBase+list)
    obj = $firebaseObject(ref)
    arr = []
    obj.$loaded().then ->

      angular.forEach obj, (value, key) ->
        arr.push value
      return arr

  dataFactory.getItemById = (itemType, id) ->
    ref = new Firebase(urlBase+itemType+'/'+id)
    obj = $firebaseObject(ref)
    obj.$loaded().then ->
    return obj

  dataFactory.getProductsByTruckId = (truckId) ->
    ref = new Firebase(urlBase+'productList/')
    obj = $firebaseObject(ref)
    arr = []
    obj.$loaded().then ->
      angular.forEach obj, (value, key) ->
        if truckId == value.productTruckId
          arr.push value
      $rootScope.selectedTruckProducts = arr
      return arr

  dataFactory.addItem = (item) ->
    ref = new Firebase(urlBase)
    ref.child("productList").push item

  dataFactory.addTruck = (item) ->
    ref = new Firebase(urlBase)
    ref.child("foodTrucks").push item

  dataFactory.deleteItem = (itemId) ->
    ref = new Firebase(urlBase+'productList/')
    ref.child(itemId).remove();
   
  dataFactory

