define ['jquery', 'underscore', 'syphon', 'marionette', 'templates'], ($, _, Syphon, Marionette, templates) ->
	Marionette.ItemView.extend
		template: _.template templates.cursoForm
		ui:
			form: '#cursoForm'
		events:
			'click #add': 'addCurso'
		addCurso: (e) ->
			e.preventDefault()
			data = Syphon.serialize @ui.form[0]
			@collection.create data, {wait: true}
			@collection.sort()
			@ui.form[0].reset()