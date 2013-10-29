require.config
  paths:
    'backbone'           : 'lib/backbone'
    'backbone.babysitter': 'lib/backbone.babysitter.amd'
    'backbone.picky'     : 'lib/backbone.picky.amd'
    'backbone.syphon'    : 'lib/backbone.syphon.amd'
    'backbone.validation': 'lib/backbone.validation.amd'
    'backbone.wreqr'     : 'lib/backbone.wreqr.amd'
    'bootstrap'          : 'lib/bootstrap'
    'json2'              : 'lib/json2'
    'jquery'             : 'lib/jquery'
    'jquery.spin'        : 'lib/jquery.spin'
    'marionette'         : 'lib/backbone.marionette.amd'
    'spin'               : 'lib/spin'
    'tpl'                : 'lib/tpl'
    'underscore'         : 'lib/underscore'
    'templates'          : '../templates'

  shim:
    'underscore':
      exports: '_'
    'backbone':
      deps: ['jquery', 'underscore', 'json2']
      exports: 'Backbone'
    'bootstrap': ['jquery']
    'jquery.spin': ['spin', 'jquery']

require ['app'], (App) ->
  'use strict'
  App.start()
  return