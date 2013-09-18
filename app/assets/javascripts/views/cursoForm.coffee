define ['jquery', 'underscore', 'marionette', 'text!templates/cursoForm.html'], ($, _, Marionette, cursoFormTemplate) ->
	CursoFormView = Marionette.ItemView.extend
		template: _.template cursoFormTemplate