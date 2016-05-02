angular.module 'app'
.controller 'ProgressLinearCtrl', [
  '$scope'
  '$interval'
  ($scope, $interval) ->
    self = @
    j = counter = 0
    self.mode = 'query'
    self.activated = true
    self.determinateValue = 30
    self.determinateValue2 = 30
    self.modes = []
    self.toggleActivation = ->
      if self.activated
        j = counter = 0
        self.determinateValue = 30
        self.determinateValue2 = 30
      else
        self.modes = []
      true
    $interval(->
      self.determinateValue += 1
      self.determinateValue2 += 1.5
      self.determinateValue = 30 if self.determinateValue > 100
      self.determinateValue2 = 30 if self.determinateValue2 > 100
      if j < 2 and not self.modes[j] and self.activated
        self.modes[j] = if j == 0 then 'buffer' else 'query'
      j++ if counter++ % 4 is 0
      true
    , 100, 0, true)
    $interval(->
      self.mode = if self.mode == 'query' then 'determinate' else 'query'
    , 7200, 0, true)
    true
]
