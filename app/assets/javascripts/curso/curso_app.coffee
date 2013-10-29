define [
  'app'
], (MainApp) ->
  'use strict'

  MainApp.module 'CursoApp', (CursoApp, MainApp, Backbone, Marionette, $, _) ->
    CursoApp.startWithParent = false

    CursoApp.onStart = ->
      console.log "starting CursoApp"

    CursoApp.onStop = ->
      console.log "stopping CursoApp"

    return # end of module

  MainApp.module 'Routers.CursoApp', (CursoApp, MainApp, Backbone, Marionette, $, _) ->
    class CursoApp.Router extends Marionette.AppRouter
      appRoutes:
        'cursos': 'listCursos'
        'cursos/:id': 'showCurso',
        'cursos/:id/edit': 'editCurso'

    API =
      listCursos: ->
        require ['curso/curso_controller'], ->
          MainApp.startSubApp("CursoApp")
          new MainApp.CursoApp.Controller().list()
          return
        return
      showCurso: ->
        console.log 'TODO Routers.CursoApp.showCurso'
        return
      editCurso: (id) ->
        console.log 'TODO Routers.CursoApp.editCurso'
        require ['curso/curso_controller'], ->
          MainApp.startSubApp("CursoApp")
          new MainApp.CursoApp.Controller().edit(id)
          return
        return

    MainApp.on 'curso:list', ->
      Backbone.history.navigate 'cursos'
      API.listCursos()
      return

    MainApp.on 'curso:edit', (id) ->
      Backbone.history.navigate "cursos/#{id}/edit"
      API.editCurso(id)
      return

    MainApp.addInitializer ->
      new CursoApp.Router(controller: API)
      return

    return # end of module

  return MainApp.Routers.CursoApp # end of define