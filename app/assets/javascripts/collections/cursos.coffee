define ['backbone', 'models/curso'], (Backbone, Curso) ->
	class Cursos extends Backbone.Collection
		initialize: ->
			#console.log 'CursoList Initialized...'
			@on 'all', (e) -> console.log 'CursoList event: ' + e
		comparator: (curso) ->
  			curso.get('nombre').toLowerCase()
		model: Curso
		url: '/api/cursos'