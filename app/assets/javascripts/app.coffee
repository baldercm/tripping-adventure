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
			deps : ['jquery', 'underscore', 'backbone']
			exports : 'Marionette'

require ['views/cursos'], (CursosView) ->
	cursosView = new CursosView