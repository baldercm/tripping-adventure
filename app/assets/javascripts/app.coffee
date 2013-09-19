define ['marionette', 'collections/cursos', 'views/cursos', 'views/cursoForm'], (Marionette, Cursos, CursosView, CursoFormView) ->
	App = new Marionette.Application()
	
	App.addRegions
		"form": "#cursos #form"
		"list": "#cursos #list"
	
	App.addInitializer ->
		cursoFormView = new CursoFormView
		App.form.show cursoFormView
		
		cursos = new Cursos
		cursos.fetch
			reset: true
		cursosView = new CursosView
			collection: cursos
		App.list.show cursosView
	
	App