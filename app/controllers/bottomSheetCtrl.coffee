angular.module 'app'
.controller 'BottomSheetCtrl', [
  '$scope'
  '$timeout'
  '$mdBottomSheet'
  '$mdToast'
  ($scope, $timeout, $mdBottomSheet, $mdToast) ->
    $scope.alert = ''
    $scope.showListBottomSheet = ($event) ->
      $scope.alert = ''
      $mdBottomSheet.show
        templateUrl: 'bottom-sheet-list-template.html'
        controller: 'ListBottomSheetCtrl'
        targetEvent: $event
      .then (clickedItem) ->
        $scope.alert = "#{clickedItem.name} clicked!"

    $scope.showGridBottomSheet = ($event) ->
      $scope.alert = ''
      $mdBottomSheet.show
        templateUrl: 'bottom-sheet-grid-template.html'
        controller: 'GridBottomSheetCtrl'
        clickOutsideToClose: false
        targetEvent: $event
      .then (clickedItem) ->
        $mdToast.show(
          $mdToast.simple "#{clickedItem.name} clicked!"
          .position 'top right'
          .hideDelay 1500
        )
]
.controller 'ListBottomSheetCtrl', [
  '$scope'
  '$mdBottomSheet'
  ($scope, $mdBottomSheet) ->
    $scope.items = [
      {name: "Share", icon: 'share'}
      {name: "Upload", icon: 'file_upload'}
      {name: "Copy", icon: 'content_copy'}
      {name: "Print this page", icon: 'print' }
    ]
    $scope.listItemClick = ($index) ->
      $mdBottomSheet.hide $scope.items[$index]
]
.controller 'GridBottomSheetCtrl', [
  '$scope'
  '$mdBottomSheet'
  ($scope, $mdBottomSheet) ->
    $scope.items = [
      {name: "Pizza", icon: 'local_pizza'}
      {name: "Mail", icon: 'mail'}
      {name: "Message", icon: 'message'}
      {name: "Copy", icon: 'content_copy'}
    ]
    $scope.listItemClick = ($index) ->
      $mdBottomSheet.hide $scope.items[$index]
]
