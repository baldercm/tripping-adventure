define [
  'app'
], (MainApp) ->
  'use strict'

  MainApp.module 'CursoApp.Model', (Model, MainApp, Backbone, Marionette, $, _) ->
    class Model.Curso extends Backbone.Model
#       initialize: ->
#         @on 'all', (e) -> console.log @get('id') + ':' + @get('nombre') + ' - event: ' + e
      defaults:
        nombre: ''
      validation:
        nombre:
          required: true
          minLength: 1
          msg: 'Nombre obligatorio'
      urlRoot: 'api/cursos'

    class Model.CursoCollection extends Backbone.Collection
#       initialize: ->
#         @on 'all', (e) -> console.log 'CursoList event: ' + e
      comparator: (curso) ->
        curso.get('nombre').toLowerCase()
      model: Model.Curso
      url: 'api/cursos'

    return # end of module

  return MainApp.CursoApp.Model # end of define