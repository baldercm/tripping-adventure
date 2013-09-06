class app.CursoView extends Backbone.View
	initialize: ->
		#console.log 'CursoView Initialized...'
		#@on 'all', (e) -> console.log 'CursoView event: ' + e
	events:
		'click .edit' : 'editCurso'
	editCurso: ->
		console.warn 'TODO editCurso'
	render: ->
		console.log 'CursoView Rendered...'
		@$el.html @template @model.toJSON()
	tagName:   'tr'
	className: 'cursoRow'
	template: _.template $('#cursoTemplate').html()