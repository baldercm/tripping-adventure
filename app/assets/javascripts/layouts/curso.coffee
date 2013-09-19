define ['underscore', 'marionette', 'text!templates/cursoLayout.html'], (_, Marionette, layoutTemplate) ->
	CursoLayout = Marionette.Layout.extend
		template: _.template layoutTemplate
		regions:
			form: "#form"
			list: "#list"
