angular.module 'app'
.controller 'ButtonCtrl', [
  '$scope'
  ($scope) ->
    $scope.title1 = "Button"
    $scope.title4 = "Warn"
    $scope.isDisabled = true
    $scope.googleUrl = 'http://google.com'
]
