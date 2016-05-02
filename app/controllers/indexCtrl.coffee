angular.module 'app'
.controller 'IndexCtrl', [
  '$scope'
  '$mdSidenav'
  '$state'
  ($scope, $mdSidenav, $state) ->
    $scope.menuItems = [
      {name: 'autocomplete',      path: 'autocomplete'}
      {name: 'bottom sheet',      path: 'bottomSheet'}
      {name: 'button',            path: 'button'}
      {name: 'card',              path: 'card'}
      {name: 'date picker',       path: 'datePicker'}
      {name: 'grid list',         path: 'gridList'}
      {name: 'input',             path: 'input'}
      {name: 'progress circular', path: 'progressCircular'}
      {name: 'progress linear',   path: 'progressLinear'}
      {name: 'toast',             path: 'toast'}
      {name: 'whiteframe',        path: 'whiteframe'}
    ]
    $scope.title = 'home'
    $scope.go = (path, title) ->
      $state.go path
      $scope.title = title
    $scope.toggleLeft = -> $mdSidenav('left').toggle
    $scope.menuItem = 'menu'
    $scope.menuToggle = ->
      if $scope.menuIcon == 'menu'
        $mdSidenav('left').open()
        $scope.menuIcon = 'arrow_back'
      else
        $mdSidenav('left').close()
        $scope.menuIcon = 'menu'
]
