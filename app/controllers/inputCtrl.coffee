angular.module 'app'
.controller 'InputCtrl', [
  '$scope'
  ($scope) ->
    $scope.project =
      description: "Nuclear Missile Defense System"
      rate: 500
]
