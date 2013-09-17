require.config
	paths:
		jquery     : 'empty:'
		underscore : 'empty:'
		backbone   : 'empty:'
		marionette : 'empty:'
		bootstrap  : 'empty:'
		text       : 'lib/require.text'
		templates  : '../templates'
	shim:
		'underscore':
			exports: '_'
		'backbone':
			deps: ['jquery', 'underscore']
			exports: 'Backbone'
		'marionette':
			deps : ['jquery', 'underscore', 'backbone']
			exports : 'Marionette'