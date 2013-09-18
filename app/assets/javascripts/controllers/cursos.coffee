define ['jquery', 'underscore', 'marionette', 'collections/cursos', 'views/cursos', 'views/cursoForm'], ($, _, Marionette, Cursos, CursosView, CursoFormView) ->
	CursosController = Marionette.Controller.extend
		initialize: (options) ->
			@form = options.form
			@list = options.list
		show: ->
			cursoFormView = new CursoFormView
			@form.show cursoFormView
			
			cursos = new Cursos
			cursos.fetch
				reset: true
			cursosView = new CursosView
				collection: cursos
			@list.show cursosView