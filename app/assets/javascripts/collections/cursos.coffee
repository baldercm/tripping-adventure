class app.Cursos extends Backbone.Collection
	initialize: ->
		#console.log 'CursoList Initialized...'
		@on 'all', (e) -> console.log 'CursoList event: ' + e
	model: app.Curso
	url: '/api/cursos'