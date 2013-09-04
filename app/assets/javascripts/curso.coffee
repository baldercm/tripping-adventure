$ ->
	$.get "/curso/list", (data) ->
		$("#cursos thead").append $("<tr>").append $("<th>").text "Curso"
		$.each data, (index, curso) ->
			$("#cursos tbody").append $("<tr>").append $("<td>").text curso.nombre
	$("form#create-curso-form").submit (event) ->
		event.preventDefault()
		jqxhr = $.post '/curso/create', $("form#create-curso-form").serialize(), (data) ->
			$("form#create-curso-form")[0].reset()
			$("#cursos tbody").append $("<tr>").append $("<td>").text data.nombre
