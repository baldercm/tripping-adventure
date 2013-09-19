require.config
	paths:
		jquery     : '//cdnjs.cloudflare.com/ajax/libs/jquery/1.10.2/jquery.min'
		underscore : '//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min'
		backbone   : '//cdnjs.cloudflare.com/ajax/libs/backbone.js/1.0.0/backbone-min'
		marionette : '//cdnjs.cloudflare.com/ajax/libs/backbone.marionette/1.1.0-bundled/backbone.marionette.min'
		text       : '//cdnjs.cloudflare.com/ajax/libs/require-text/2.0.10/text.min'
		bootstrap  : '//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min'
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

require ['app'], (App) ->
	"use strict"
	App.start()