#= require_self
#= require_tree ./services
#= require_tree ./controllers

App = angular.module 'InstaSearch', [
  'ngResource'
  'ngtimeago'
  'ngCookies'
  'ngMaterial'
  'templates'
]
