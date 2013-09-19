define ['jquery', 'underscore', 'marionette', 'templates'], ($, _, Marionette, templates) ->
	CursoFormView = Marionette.ItemView.extend
		template: _.template templates.cursoForm