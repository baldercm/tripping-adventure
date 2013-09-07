class app.CursosView extends Backbone.View
	initialize: ->
		#console.log 'CursoListView Initialized...'
		#@on 'all', (e) -> console.log 'CursoListView event: ' + e
		@collection = new app.Cursos
		@collection.fetch {reset: true}
		@render()
		@listenTo @collection, 'add', @renderCurso
		@listenTo @collection, 'reset', @render
	events:
		'click #add' : 'addCurso'
	addCurso: (e) ->
		e.preventDefault()
		formData = {}
		$('#addCurso').find('input').each (i, el) ->
			if $(el).val() != ''
				formData[el.id] = $(el).val()
			$(el).val ''
		@collection.create formData, {wait: true}
	render: ->
		console.log 'CursoListView Rendered...'
		@renderCurso curso for curso in @collection.models
	renderCurso: (curso) ->
		cursoView = new app.CursoView {model: curso}
		cursoView.render()
		@$el.find('tbody').append cursoView.el
	el: '#cursosContainer' 