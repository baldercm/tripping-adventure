$ ->
	$.get jsRoutes.controllers.Cursos.listJson().url, (data) ->
		$('#cursos thead').append $('<tr>').append $('<th>').text 'Curso'
		$.each data, (index, curso) ->
			link = $('<a>').attr('href', jsRoutes.controllers.Cursos.view(curso.id).url) .text curso.nombre
			$('#cursos tbody').append $('<tr>').append $('<td>').append link
	
	$('button#create-curso-btn').click (event) ->
		event.preventDefault()
		form = $('form#create-curso-form').get()[0]
		#form.reset()
		nombre = form.nombre.value
		curso = new Curso
			nombre: nombre
		curso.save null, success: ->
			console.log curso.nombre
			href = jsRoutes.controllers.Cursos.view(curso.id).url
			text = curso.get 'nombre'
			link = $('<a>').attr('href', href).text text
			$('#cursos tbody').append $('<tr>').append $('<td>').append link

# Curso model
class Curso extends Backbone.Model
	initialize: ->
		console.log 'Curso Initialized...'
		@on 'all', (e) -> console.log @get('nombre') + ' event: ' + e
	urlRoot: '/curso'