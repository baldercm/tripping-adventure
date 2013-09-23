require.config
	paths:
		jquery     : 'empty:'
		underscore : 'empty:'
		backbone   : 'empty:'
		validation : 'empty:'
		syphon     : 'empty:'
		wreqr      : 'empty:'
		marionette : 'empty:'
		bootstrap  : 'empty:'
		templatesPath : '../templates'
	
	shim:
		'underscore':
			exports: '_'
		'backbone':
			deps: ['jquery', 'underscore']
			exports: 'Backbone'
		'syphon':
			deps : ['backbone']
			exports : 'Backbone.Syphon'
		'wreqr':
			deps : ['backbone']
			exports : 'Backbone.Wreqr'
		'marionette':
			deps : ['backbone']
			exports : 'Marionette'
	
	#stubModules: ['tpl']