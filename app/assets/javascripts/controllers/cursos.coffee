define ['jquery', 'underscore', 'marionette', 'layouts/curso', 'collections/cursos', 'views/cursos', 'views/cursoForm'],
($, _, Marionette, CursoLayout, Cursos, CursosView, CursoFormView) ->
	class CursosController extends Marionette.Controller
		start: ->
			cursos = new Cursos
			
			container = new Marionette.Region
  				el: '#container'
  			
			layout = new CursoLayout
			container.show layout
			
			options = {collection: cursos}
			
			layout.form.show new CursoFormView options
			layout.list.show new CursosView options
			
			cursos.fetch {reset: true}