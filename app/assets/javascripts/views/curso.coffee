define ['jquery', 'underscore', 'marionette', 'vent', 'templates', 'views/cursoForm'], ($, _, Marionette, vent, templates, CursoFormView) ->
	Marionette.ItemView.extend
		template: templates.curso
		initialize: ->
			@model.bind 'change', @render, @
		events:
			'click .edit' : 'editCurso'
		editCurso: ->
			vent.trigger 'curso:edit', @model
		tagName:   'tr'
		className: 'curso-view'