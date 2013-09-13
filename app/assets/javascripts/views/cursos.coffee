define ['jquery', 'underscore', 'backbone', 'collections/cursos', 'views/curso'],
($, _, Backbone, Cursos, CursoView) ->
	CursosView =  Backbone.View.extend
		initialize: ->
			#console.log 'CursoListView Initialized...'
			#@on 'all', (e) -> console.log 'CursoListView event: ' + e
			@collection = new Cursos
			@collection.fetch {reset: true}
			@listenTo @collection, 'add', @render
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
			@collection.sort()
		render: ->
			console.log 'CursoListView Rendered...'
			@$el.find('tbody').empty()
			@renderCurso curso for curso in @collection.models
		renderCurso: (curso) ->
			cursoView = new CursoView {model: curso}
			cursoView.render()
			@$el.find('tbody').append cursoView.el
		el: '#cursos' 