define [
  'app'
  'curso/curso_view'
  'curso/curso_model'
], (MainApp) ->
  'use strict'

  MainApp.module 'CursoApp', (CursoApp, MainApp, Backbone, Marionette, $, _) ->
    class CursoApp.Controller extends Marionette.Controller
      list: ->
        cursos = new CursoApp.Model.CursoCollection()
        cursos.fetch {reset: true}

        layout = new CursoApp.View.Layout()
        toolbarView = new CursoApp.View.Toolbar()
        listView = new CursoApp.View.List(collection: cursos)

        layout.on 'show', ->
          layout.toolbarRegion.show toolbarView
          layout.listRegion.show listView
          return

        toolbarView.on 'curso:new', ->
          require ['curso/curso_view'], ->
            curso = new CursoApp.Model.Curso()
            formView = new CursoApp.View.Form(model: curso)

            formView.on 'curso:save', (data) ->
              cursos.create data,
                wait: true
                success: ->
                  layout.formRegion.close()

            formView.on 'curso:back', ->
              layout.formRegion.close()

            layout.formRegion.show formView
            return
          return

        listView.on 'itemview:curso:edit', (itemView, curso) ->
          MainApp.trigger 'curso:edit', curso.id
          return

        MainApp.mainRegion.show layout
        return

      edit: (cursoId) ->
        curso = new CursoApp.Model.Curso(_id: cursoId)
        defer = $.Deferred()
        curso.fetch
          success: (data) ->
            defer.resolve(data)
          error: (data) ->
            defer.resolve(undefined)
        $.when(defer.promise()).done (curso) ->
          formView = new CursoApp.View.Form(model: curso)

          formView.on 'curso:save', (data) ->
            curso.save data,
              success: ->
                MainApp.trigger 'curso:list'
                MainApp.mainRegion.close()

          formView.on 'curso:back', ->
            MainApp.trigger 'curso:list'
            MainApp.mainRegion.close()

          MainApp.mainRegion.show formView
          return

    return # end of module

  return MainApp.CursoApp.Controller # end of define