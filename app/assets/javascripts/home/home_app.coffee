define [
  'app'
  'vent'
  'home/home_router'
  'home/home_controller'
], (mainApp, vent, HomeRouter, HomeController) ->
  'use strict'

  homeController = new HomeController {mainRegion: mainApp.mainRegion}

  API =
    welcome: ->
      homeController.welcome()
      return

  mainApp.addInitializer ->
    new HomeRouter {controller: API}
    return

  vent.on 'home', ->
    Backbone.history.navigate 'home'
    API.welcome()
    return

  return