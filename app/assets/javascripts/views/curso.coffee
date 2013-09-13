define ['jquery', 'underscore', 'backbone', 'text!templates/curso.html'], ($, _, Backbone, cursoTemplate) ->
	CursoView = Backbone.View.extend
		initialize: ->
			#console.log 'CursoView Initialized...'
			#@on 'all', (e) -> console.log 'CursoView event: ' + e
		events:
			'click .edit' : 'editCurso'
		editCurso: ->
			console.warn 'TODO editCurso'
		render: ->
			console.log 'CursoView Rendered...'
			@$el.html @template @model.toJSON()
		tagName:   'tr'
		className: 'cursoRow'
		template: _.template cursoTemplate