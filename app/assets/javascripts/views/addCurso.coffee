define ['jquery', 'underscore', 'backbone', 'models/curso', 'text!templates/addCurso.html'], ($, _, Backbone, Curso, addCursoTemplate) ->
	AddCursoView = Backbone.View.extend
		initialize: ->
			#console.log 'AddCursoView Initialized...'
			#@on 'all', (e) -> console.log 'AddCursoView event: ' + e
			@model = new Curso
			@render()
		events:
			'click .save' : 'saveCurso'
		saveCurso: ->
			@model.save()
		render: ->
			console.log 'AddCursoView Rendered...'
			@$el.html @template @model.toJSON()
		template: _.template addCursoTemplate
		el: '#addCursoContainer'