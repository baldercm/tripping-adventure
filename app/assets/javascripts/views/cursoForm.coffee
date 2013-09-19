define ['jquery', 'underscore', 'marionette', 'templates'], ($, _, Marionette, templates) ->
	class CursoFormView extends Marionette.ItemView
		template: _.template templates.cursoForm