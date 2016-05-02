angular.module 'app'
.controller 'DatePickerCtrl', [
  '$scope'
  ($scope) ->
    $scope.myDate = new Date()
    $scope.minDate = new Date(
      $scope.myDate.getFullYear(),
      $scope.myDate.getMonth() - 2,
      $scope.myDate.getDate()
    )
    $scope.maxDate = new Date(
      $scope.myDate.getFullYear(),
      $scope.myDate.getMonth() + 2,
      $scope.myDate.getDate()
    )
    $scope.onlyWeekendsPredicate = (date) -> date.getDay() in [0,6]
    true
]
