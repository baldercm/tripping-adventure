define ['jquery', 'underscore', 'marionette', 'views/curso', 'templates'], ($, _, Marionette, CursoView, templates) ->
	Marionette.CompositeView.extend
		template: _.template templates.cursos
		itemView: CursoView
		itemViewContainer: 'tbody'
		_initialEvents: ->
			@listenTo @collection, 'add', @render, @
			@listenTo @collection, 'remove', @removeItemView, @
			@listenTo @collection, 'reset', @render, @
