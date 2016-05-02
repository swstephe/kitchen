angular.module 'app'
.controller 'ProgressCircularCtrl', [
  '$scope'
  '$interval'
  ($scope, $interval) ->
    self = @
    j = counter = 0
    self.modes = []
    self.activated = true
    self.determinateValue = 30

    # Turn off or on the 5 themed loaders
    self.toggleActivation = ->
      if self.activated
        j = counter = 0
      else
        self.modes = []

    $interval(->
      self.determinateValue++
      self.determinateValue = 30 if self.determinateValue > 100
      self.modes[j] = 'indeterminate' if j < 5 and not self.modes[j] and self.activated
      j++ if counter++ % 4 is 0
    , 100, 0, true)
    true
]
