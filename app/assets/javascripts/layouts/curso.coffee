define ['underscore', 'marionette', 'templates'], (_, Marionette, templates) ->
	Marionette.Layout.extend
		template: _.template templates.cursoLayout
		regions:
			form: '#form'
			list: '#list'
