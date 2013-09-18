define ['jquery', 'underscore', 'marionette', 'views/curso', 'text!templates/cursos.html'], ($, _, Marionette, CursoView, cursosTemplate) ->
	CursosView =  Marionette.CompositeView.extend
		initialize: ->
			#console.log 'CursoListView Initialized...'
			#@on 'all', (e) -> console.log 'CursoListView event: ' + e
		itemView: CursoView
		itemViewContainer: 'tbody'
		template: _.template cursosTemplate