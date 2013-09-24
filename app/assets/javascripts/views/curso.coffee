define ['jquery', 'underscore', 'backbone', 'marionette', 'vent', 'templates', 'views/cursoForm'], ($, _, Backbone, Marionette, vent, templates, CursoFormView) ->
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
			Backbone.history.navigate(@model.id + "/edit");
			vent.trigger "curso:edit", @model