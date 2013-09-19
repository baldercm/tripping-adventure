define ['marionette', 'controllers/cursos'], (Marionette, CursosController) ->
	App = new Marionette.Application()
	
	App.addRegions
		'form': '#cursos #form'
		'list': '#cursos #list'
	
	App.addInitializer ->
		controller = new CursosController
		controller.start()
	
	App