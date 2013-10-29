require.config
  paths:
    'backbone'           : 'empty:'
    'backbone.babysitter': 'empty:'
    'backbone.picky'     : 'empty:'
    'backbone.syphon'    : 'empty:'
    'backbone.validation': 'empty:'
    'backbone.wreqr'     : 'empty:'
    'bootstrap'          : 'empty:'
    'json2'              : 'empty:'
    'jquery'             : 'empty:'
    'jquery.spin'        : 'empty:'
    'marionette'         : 'empty:'
    'spin'               : 'empty:'
    'tpl'                : 'tpl'
    'underscore'         : 'empty:'
    'templates'          : '../templates'

  shim:
    'underscore':
      exports: '_'
    'backbone':
      deps: ['jquery', 'underscore', 'json2']
      exports: 'Backbone'
    'bootstrap': ['jquery']
    'jquery.spin': ['spin', 'jquery']

  stubModules: ['tpl']