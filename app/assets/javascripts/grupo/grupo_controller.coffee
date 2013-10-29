define [
  'marionette'
  'vent'
  'grupo/grupo_layout'
], (Marionette, vent, GrupoLayout) ->
  'use strict'

  GrupoController = Marionette.Controller.extend
    initialize: (options) ->
      @mainRegion = options.mainRegion
      return

    list: ->
      grupoLayout = new GrupoLayout()
      @mainRegion.show grupoLayout
      return

  return GrupoController # end of define