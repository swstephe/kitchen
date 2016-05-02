angular.module 'app'
.controller 'AutocompleteCtrl', [
  '$timeout'
  '$q'
  '$log'
  ($timeout, $q, $log) ->
    self = @
    self.simulateQuery = false
    self.isDisabled = false

    # list of 'state' value/display objects
    loadAll = ->
      allStates = [
        "Alabama"
        "Alaska"
        "Arizona"
        "Arkansas"
        "California"
        "Colorado"
        "Connecticut"
        "Delaware"
        "Florida"
        "Georgia"
        "Hawaii"
        "Idaho"
        "Illinois"
        "Indiana"
        "Iowa"
        "Kansas"
        "Kentucky"
        "Louisana"
        "Maine"
        "Maryland"
        "Massachusetts"
        "Michigan"
        "Minnesota"
        "Missippi"
        "Missouri"
        "Montana"
        "Nebraska"
        "Nevada"
        "New Hampshire"
        "New Jersey"
        "New Mexico"
        "New York"
        "North Carolina"
        "North Dakota"
        "Okio"
        "Oklahoma"
        "Oregon"
        "Pennsylvania"
        "Rhode Island"
        "South Carolina"
        "South Dakota"
        "Tennessee"
        "Texas"
        "Utah"
        "Vermont"
        "Virginia"
        "Washington"
        "West Virginia"
        "Wisconsin"
        "Wyoming"
      ]
      {value: state.toLowerCase(), display: state} for state in allStates

    createFilterFor = (query) ->
      lowercaseQuery = angular.lowercase query
      (state) -> state.value.indexOf(lowercaseQuery) is 0

    self.states = loadAll()
    self.querySearch = (query) ->
      if query
        results = self.states.filter createFilterFor query
      else
        results = self.states
      if self.simulateQuery
        deferred = $q.defer()
        $timeout (-> deferred.resolve results), Math.random()*1000, false
        deferred.promise
      else
        results

    self.selectedItemChange = (item) ->
      $log.info "Item changed to " + JSON.stringify(item)

    self.searchTextChange = (text) ->
      $log.info "Text changed to #{text}"

    self.newState = (state) ->
      alert "Sorry! You'll need to create a Constitution for #{state} first!"

    true
]
