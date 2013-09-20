define ['jquery', 'underscore', 'marionette', 'templates'], ($, _, Marionette, templates) ->
	Marionette.ItemView.extend
		template: _.template templates.curso
		events:
			'click .edit' : 'editCurso'
		editCurso: ->
			console.warn 'TODO editCurso'
		tagName:   'tr'
		className: 'curso-view'