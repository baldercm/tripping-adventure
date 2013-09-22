define ['jquery', 'underscore', 'marionette', 'layouts/curso', 'collections/cursos', 'views/cursos', 'views/cursoForm'],
($, _, Marionette, CursoLayout, Cursos, CursosView, CursoFormView) ->
	Marionette.Controller.extend
		start: ->
			cursos = new Cursos
			
			container = new Marionette.Region
  				el: '#curso-container'
  			
			layout = new CursoLayout
			container.show layout
			
			options = {collection: cursos}
			
			layout.form.show new CursoFormView options
			layout.list.show new CursosView options
			
			cursos.fetch {reset: true}
