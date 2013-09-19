define ['underscore', 'marionette', 'templates'], (_, Marionette, templates) ->
	class CursoLayout extends Marionette.Layout
		template: _.template templates.cursoLayout
		regions:
			form: '#form'
			list: '#list'
