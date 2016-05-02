angular.module 'app'
.controller 'ToastCtrl', [
  '$scope'
  '$mdToast'
  '$document'
  ($scope, $mdToast, $document) ->
    last =
      bottom: false
      top: true
      left: false
      right: true

    sanitizePosition = ->
      current = $scope.toastPosition
      current.top = false if current.bottom and last.top
      current.bottom = false if current.top and last.bottom
      current.left = false if current.right and last.left
      current.right = false if current.left and last.right
      last = angular.extend {}, current

    $scope.toastPosition = angular.extend {}, last
    $scope.getToastPosition = ->
      sanitizePosition()
      Object.keys $scope.toastPosition
      .filter((pos) -> $scope.toastPosition[pos])
      .join ' '
    $scope.showCustomToast = ->
      $mdToast.show
        controller: 'ToastCtrl'
        templateUrl: 'toast-template.html'
        parent: $document[0].querySelector('#toastBounds')
        hideDelay: 6000
        position: $scope.getToastPosition()
    $scope.showSimpleToast = ->
      $mdToast.show(
        $mdToast.simple "Simple Toast!"
        .position $scope.getToastPosition()
        .hideDelay 3000
      )
    $scope.showActionToast = ->
      toast = $mdToast.simple("Action Toast!")
      .action 'OK'
      .highlightAction false
      .position $scope.getToastPosition()
      $mdToast.show toast
      .then (response) ->
        alert "You clicked 'OK'." if response == 'ok'
        $scope.closeToast = -> $mdToast.hide()
    true
]
