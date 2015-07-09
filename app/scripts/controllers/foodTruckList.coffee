'use strict'

angular.module('foodTruckApp').controller 'FoodTruckListCtrl', ($scope, $filter, dataFactory, toastr) ->

	$scope.clearForm = () ->
		$scope.newFoodTruckName = null
		$scope.newFoodTruckOwner = null

	$scope.getList = (listType) ->
		dataFactory.getList(listType).then (response) ->
			if listType == 'foodTrucks'
				$scope.foodTrucks = response
			else
				$scope.productList = response

	$scope.addFoodTruck = () ->
		$scope.newItem =
		  'truckName': $scope.newFoodTruckName
		  'truckOwnerName': $scope.newFoodTruckOwner

		dataFactory.addTruck($scope.newItem)
		$scope.getList('foodTrucks')
		toastr.success 'Success', $scope.newFoodTruckName+' has been added'
		$scope.clearForm()

	$scope.getList('foodTrucks')