define ['jquery', 'underscore', 'validation', 'syphon', 'marionette', 'vent', 'templates', 'models/curso'], ($, _, Validation, Syphon, Marionette, vent, templates, Curso) ->
	Marionette.ItemView.extend
		template: _.template templates.cursoForm
		initialize: ->
			vent.bind 'curso:edit', @editCurso, @
			@model = new Curso
			Validation.bind @
		ui:
			form: '#cursoForm'
		events:
			'click #save': 'saveCurso'
		saveCurso: (e) ->
			e.preventDefault()
			data = Syphon.serialize @ui.form[0]
			@model.set data
			@collection.create @model, {wait: true}
			if @model.isValid()
				@collection.sort()
				@ui.form[0].reset()
				@model = new Curso
		editCurso: (curso) ->
			@model = curso
			Syphon.deserialize @, curso.attributes