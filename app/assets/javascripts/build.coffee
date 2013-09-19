require.config
	paths:
		jquery     : 'empty:'
		underscore : 'empty:'
		backbone   : 'empty:'
		syphon     : 'empty:'
		marionette : 'empty:'
		bootstrap  : 'empty:'
		templates  : '../templates'
	
	shim:
		'underscore':
			exports: '_'
		'backbone':
			deps: ['jquery', 'underscore']
			exports: 'Backbone'
		'marionette':
			deps : ['backbone']
			exports : 'Marionette'
	
	stubModules: ['text']