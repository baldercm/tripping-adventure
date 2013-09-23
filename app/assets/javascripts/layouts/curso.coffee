define ['underscore', 'marionette', 'templates'], (_, Marionette, templates) ->
	Marionette.Layout.extend
		template: templates.cursoLayout
		regions:
			form: '#form'
			list: '#list'
