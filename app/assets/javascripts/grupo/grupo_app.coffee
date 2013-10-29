define [
  'app'
  'vent'
  'grupo/grupo_router'
  'grupo/grupo_controller'
], (MainApp, vent, GrupoRouter, GrupoController) ->
  'use strict'

  grupoController = new GrupoController {mainRegion: MainApp.mainRegion}

  API =
    listGrupos: ->
      console.log 'TODO Routers.GrupoApp.listGrupos'
      MainApp.startSubApp 'GrupoApp'
      grupoController.list()
      return
    showGrupo: ->
      console.log 'TODO Routers.GrupoApp.showGrupo'
      return
    editGrupo: (id) ->
      console.log 'TODO Routers.GrupoApp.editGrupo'
      MainApp.startSubApp 'GrupoApp'
      grupoController.edit id
      return

  MainApp.addInitializer ->
    new GrupoRouter {controller: API}
    return

  vent.on 'grupo:list', ->
    Backbone.history.navigate 'grupos'
    API.listGrupos()
    return

  vent.on 'grupo:edit', (id) ->
    Backbone.history.navigate "grupos/#{id}/edit"
    API.editGrupo id
    return

  return