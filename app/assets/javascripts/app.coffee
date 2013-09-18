require.config
	paths:
		jquery     : 'lib/jquery-1.10.2'
		underscore : 'lib/underscore'
		backbone   : 'lib/backbone'
		marionette : 'lib/backbone.marionette'
		bootstrap  : 'lib/bootstrap'
		text       : 'lib/require.text'
		templates  : '../templates'
		curso      : 'curso.min'
		cursos     : 'cursos.min'
	shim:
		'underscore':
			exports: '_'
		'backbone':
			deps: ['jquery', 'underscore']
			exports: 'Backbone'
		'marionette':
			deps : ['backbone']
			exports : 'Marionette'

require ['marionette', 'controllers/cursos'], (Marionette, CursosController) ->
	App = new Marionette.Application()
	
	App.addRegions
		"form": "#cursos #form"
		"list": "#cursos #list"
	
	App.addInitializer ->
		cursosController = new CursosController
			form: App.form
			list: App.list
		cursosController.show()
	
	App.start()