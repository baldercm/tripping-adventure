define ['backbone', 'models/curso'], (Backbone, Curso) ->
	Backbone.Collection.extend
		initialize: ->
			#console.log 'CursoList Initialized...'
			@on 'all', (e) -> console.log 'CursoList event: ' + e
		comparator: (curso) ->
  			curso.get('nombre').toLowerCase()
		model: Curso
		url: '/api/cursos'