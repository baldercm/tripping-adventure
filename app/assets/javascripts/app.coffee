require.config
	paths:
		backbone   : 'lib/backbone'
		jquery     : 'lib/jquery-1.10.2'
		underscore : 'lib/underscore'
		text       : 'lib/require.text'
		templates  : '../templates'
	shim:
		'backbone':
			deps: ['underscore', 'jquery']
			exports: 'Backbone'
		'underscore':
			exports: '_'

require ['views/cursos'], (CursosView) ->
	cursosView = new CursosView