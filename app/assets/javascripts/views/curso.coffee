define ['jquery', 'underscore', 'marionette', 'vent', 'templates', 'views/cursoForm'], ($, _, Marionette, vent, templates, CursoFormView) ->
	Marionette.ItemView.extend
		template: templates.curso
		initialize: ->
			@model.bind 'change', @render, @
		events:
			"click a.edit" : "editClicked"
		tagName:   'tr'
		className: 'curso-view'
		editClicked: (e) ->
			e.preventDefault()
			e.stopPropagation()
			vent.trigger "curso:edit", @model