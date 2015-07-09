'use strict'

angular.module('foodTruckApp').controller 'ProductListCtrl', ($scope, dataFactory, toastr) ->
	$scope.clearForm = () ->
		$scope.newProductName = null
		$scope.newProductPrice = null
		$scope.newProductQTY = null
		$scope.newProductFoodTruck = null
		$scope.productList.length = null

	$scope.getList = (listType) ->
		dataFactory.getList(listType).then (response) ->
			if listType == 'foodTrucks'
				$scope.foodTrucks = response
			else
				$scope.productList = response

	$scope.deleteItem = (item) ->
		$scope.productListArr =  angular.copy($scope.productList)
		$scope.productList = []

		angular.forEach $scope.productListArr, (value, key) ->
			$scope.productList.push value
			if value.productName == item.productName
				dataFactory.deleteItem(key)
				$scope.getList('productList')
				$scope.getProductsByTruckId(item.productTruckId)

	$scope.addItem = () ->
		$scope.newItem =
		  'productName': $scope.newProductName
		  'productPrice': parseInt($scope.newProductPrice)
		  'productQTY': parseInt($scope.newProductQTY)
		  'productTruckId': parseInt($scope.newProductFoodTruck)
		  'productId': $scope.productList.length+1

		dataFactory.addItem($scope.newItem)
		$scope.getList('productList')
		$scope.getProductsByTruckId(parseInt($scope.newProductFoodTruck))
		toastr.success 'Success', $scope.newProductName+' has been added'
		$scope.clearForm()

	$scope.getProductsByTruckId = (truckId) ->
		$scope.currentTruckId = truckId
		dataFactory.getProductsByTruckId(truckId)

	$scope.getList('foodTrucks')
	$scope.getList('productList')
	$scope.getProductsByTruckId(0) # Shows first trucks products by default

