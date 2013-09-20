define ['jquery', 'underscore', 'syphon', 'marionette', 'vent', 'templates', 'models/curso'], ($, _, Syphon, Marionette, vent, templates, Curso) ->
	Marionette.ItemView.extend
		template: _.template templates.cursoForm
		initialize: ->
			vent.bind 'curso:edit', @editCurso, @
			@model = new Curso
		ui:
			form: '#cursoForm'
		events:
			'click #add': 'addCurso'
		addCurso: (e) ->
			e.preventDefault()
			data = Syphon.serialize @ui.form[0]
			@model.set data
			@collection.create @model.attributes, {wait: true}
			@collection.sort()
			@ui.form[0].reset()
			@model = new Curso
		editCurso: (curso) ->
			@model = curso
			Syphon.deserialize @, curso.attributes