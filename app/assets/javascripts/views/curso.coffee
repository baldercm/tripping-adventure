define ['jquery', 'underscore', 'marionette', 'text!templates/curso.html'], ($, _, Marionette, cursoTemplate) ->
	CursoView = Marionette.ItemView.extend
		initialize: ->
			#console.log 'CursoView Initialized...'
			#@on 'all', (e) -> console.log 'CursoView event: ' + e
		events:
			'click .edit' : 'editCurso'
		editCurso: ->
			console.warn 'TODO editCurso'
		tagName:   'tr'
		className: 'curso-view'
		template: _.template cursoTemplate