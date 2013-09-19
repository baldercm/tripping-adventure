define ['jquery', 'underscore', 'marionette', 'templates'], ($, _, Marionette, templates) ->
	class CursoView extends Marionette.ItemView
		template: _.template templates.curso
		events:
			'click .edit' : 'editCurso'
		editCurso: ->
			console.warn 'TODO editCurso'
		tagName:   'tr'
		className: 'curso-view'