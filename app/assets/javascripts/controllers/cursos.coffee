define ['jquery', 'underscore', 'marionette', 'collections/cursos', 'views/cursos'], ($, _, Marionette, Cursos, CursosView) ->
	CursosController = Marionette.Controller.extend
		initialize: (options) ->
			@region = options.region
		show: ->
			cursos = new Cursos
			cursos.fetch
				reset: true
			cursosView = new CursosView
				collection: cursos
			@region.show cursosView