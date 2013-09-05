$ ->
	$.get jsRoutes.controllers.Cursos.listJson().url, (data) ->
		$('#cursos thead').append $('<tr>').append $('<th>').text 'Curso'
		$.each data, (index, curso) ->
			link = $('<a>').attr('href', jsRoutes.controllers.Cursos.view(curso.id).url) .text curso.nombre
			$('#cursos tbody').append $('<tr>').append $('<td>').append link
	
	$('button#create-curso-btn').click (event) ->
		event.preventDefault()
		jqxhr = $.post jsRoutes.controllers.Cursos.createAjax().url, $('form#create-curso-form').serialize(), (data) ->
			$('form#create-curso-form')[0].reset()
			link = $('<a>').attr('href', jsRoutes.controllers.Cursos.view(data.id).url) .text data.nombre
			$('#cursos tbody').append $('<tr>').append $('<td>').append link

# --- Curso model ---
Curso = Backbone.Model.extend
	initialize: ->
		console.log 'Curso Initialized...'
		@on 'all', (e) -> console.log @get 'name' + 'event: ' + e
	defaults:
		nombre: 'Sin Nombre'
curso = new Curso
			nombre: 'Baldomero'
		console.log curso