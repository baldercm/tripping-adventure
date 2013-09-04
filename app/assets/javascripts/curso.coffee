$ ->
	$.get "/curso/list", (data) ->
		$("#cursos thead").append $("<tr>").append $("<th>").text "Curso"
		$.each data, (index, curso) ->
			$("#cursos tbody").append $("<tr>").append $("<td>").text curso.nombre
	
	$("button#create-curso-btn").click (event) ->
		event.preventDefault()
		jqxhr = $.post '/curso/createAjax', $("form#create-curso-form").serialize(), (data) ->
			$("form#create-curso-form")[0].reset()
			$("#cursos tbody").append $("<tr>").append $("<td>").text data.nombre
