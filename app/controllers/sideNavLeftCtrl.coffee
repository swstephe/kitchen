angular.module 'app'
.controller 'SideNavLeftCtrl', [
  '$scope'
  '$mdSidenav'
  ($scope, $mdSidenav) ->
    $scope.close = -> $mdSidenav('left').close()
]
