class app.Curso extends Backbone.Model
	initialize: ->
		console.log 'Curso Initialized...'
		@on 'all', (e) -> console.log @get('nombre') + ' event: ' + e
	defaults:
		nombre: '----'
