define [
  'marionette'
  'vent'
  'home/home_view'
], (Marionette, vent, HomeView) ->
  'use strict'

  HomeController = Marionette.Controller.extend
    initialize: (options) ->
      @mainRegion = options.mainRegion
      return

    welcome: ->
      homeView = new HomeView()
      @mainRegion.show homeView
      return

  return HomeController # end of define