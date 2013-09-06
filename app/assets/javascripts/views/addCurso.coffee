class app.AddCursoView extends Backbone.View
	initialize: ->
		#console.log 'AddCursoView Initialized...'
		#@on 'all', (e) -> console.log 'AddCursoView event: ' + e
		@model = new app.Curso
		@render()
	events:
		'click .save' : 'saveCurso'
	render: ->
		console.log 'AddCursoView Rendered...'
		@$el.html @template @model.toJSON()
	template: _.template $('#addCursoTemplate').html()
	el: '#cursos' 