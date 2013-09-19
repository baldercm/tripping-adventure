define ['jquery', 'underscore', 'marionette', 'layouts/curso', 'collections/cursos', 'views/cursos', 'views/cursoForm'],
($, _, Marionette, CursoLayout, Cursos, CursosView, CursoFormView) ->
	CursosController = Marionette.Controller.extend
		start: ->
			cursos = new Cursos
			
			container = new Marionette.Region
  				el: '#container'
  			
			layout = new CursoLayout
			container.show layout
			
			layout.form.show new CursoFormView
			layout.list.show new CursosView {collection: cursos}
			
			cursos.fetch {reset: true}