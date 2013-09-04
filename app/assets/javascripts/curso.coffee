$ ->
	$.get "/curso/list", (data) ->
		$.each data, (index, curso) ->
			$("#cursos").append $("<li>").text curso.nombre
	$("form#create-curso-form").submit (event) ->
		event.preventDefault()
		jqxhr = $.post '/curso/create', $("form#create-curso-form").serialize(), (data) ->
			$("form#create-curso-form")[0].reset()
			$("#cursos").append $("<li>").text data.nombre
