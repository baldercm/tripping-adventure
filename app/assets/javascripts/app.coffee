define [
  'marionette'
  'vent'
], (Marionette, vent) ->
  'use strict'

  mainApp = new Marionette.Application(vent: vent)

  mainApp.addRegions
    mainRegion: '#main-region'

  mainApp.startSubApp = (newAppName, options) ->
    newApp =
      if newAppName
      then mainApp.module newAppName
      else null

    if mainApp.currentApp == newApp
      return

    if mainApp.currentApp
      mainApp.currentApp.stop()

    mainApp.currentApp = newApp
    if newApp
      newApp.start options
    return

  mainApp.on 'initialize:after', ->
    require ['commons/customValidation'], ->
      mainApp.trigger 'backbone:validation:custom:applyCallbacks'
      return

    require ['home/home_app'], ->
      Backbone.history.start()
      if Backbone.history.fragment == ''
        vent.trigger 'home'
      return

    require ['curso/curso_app', 'grupo/grupo_app']

    return

  return mainApp  # end of define