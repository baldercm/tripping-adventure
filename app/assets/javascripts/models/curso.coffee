define ['backbone'], (Backbone) ->
	Curso = Backbone.Model.extend
		initialize: ->
			console.log 'Curso Initialized...'
			@on 'all', (e) -> console.log @get('nombre') + ' event: ' + e
		defaults:
			nombre: '----'
		url: 'api/cursos'