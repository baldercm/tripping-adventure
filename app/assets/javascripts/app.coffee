require.config
	paths:
		jquery     : 'lib/jquery-1.10.2'
		underscore : 'lib/underscore'
		backbone   : 'lib/backbone'
		bootstrap  : 'lib/bootstrap'
		text       : 'lib/require.text'
		templates  : '../templates'
		curso      : 'curso.min'
		cursos     : 'cursos.min'
	shim:
		'backbone':
			deps: ['underscore', 'jquery']
			exports: 'Backbone'
		'underscore':
			exports: '_'

require ['views/cursos'], (CursosView) ->
	cursosView = new CursosView