define ['jquery', 'underscore', 'marionette', 'views/curso', 'templates'], ($, _, Marionette, CursoView, templates) ->
	class CursosView extends Marionette.CompositeView
		template: _.template templates.cursos
		itemView: CursoView
		itemViewContainer: 'tbody'
