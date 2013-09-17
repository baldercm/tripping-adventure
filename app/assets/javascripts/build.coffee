require.config
	paths:
		jquery     : 'empty:'
		underscore : 'empty:'
		backbone   : 'empty:'
		bootstrap  : 'empty:'
		text       : 'lib/require.text'
		templates  : '../templates'
	shim:
		'backbone':
			deps: ['underscore', 'jquery']
			exports: 'Backbone'
		'underscore':
			exports: '_'