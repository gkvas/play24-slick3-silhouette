'use strict'

###*
 # @ngdoc function
 # @name uiApp.controller:SignupctrlCtrl
 # @description
 # # SignupctrlCtrl
 # Controller of the uiApp
###
angular.module('uiApp')
  .controller 'SignUpCtrl', ($scope,$http,$rootScope,$auth,$alert) ->
    $scope.signUpInfo = {}
    $scope.signUp = ->
      $auth.signup($scope.signUpInfo)
      .then ->
        $http.get('/whoami')
      .then (response) ->
        $rootScope.user = response.data
        $rootScope.$broadcast "userChanged"
        $alert("Welcome #{$rootScope.user.firstname}!","Success!", 'success', 'top-left')
      .catch (err) ->
        $alert(err.data.message,'You could not be registered!', 'danger', 'top-right')
