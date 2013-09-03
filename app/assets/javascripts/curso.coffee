$ ->
	$.get "/curso/list", (data) ->
		$.each data, (index, curso) ->
			$("#cursos").append $("<li>").text curso.nombre