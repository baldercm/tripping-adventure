define ['jquery', 'underscore', 'marionette', 'views/curso', 'templates'], ($, _, Marionette, CursoView, templates) ->
	CursosView =  Marionette.CompositeView.extend
		template: _.template templates.cursos
		itemView: CursoView
		itemViewContainer: 'tbody'
