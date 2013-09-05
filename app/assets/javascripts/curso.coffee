# Onload
$ ->
	cursoList.fetch success: ->
		cursoView = new CursoListView {collection: cursoList}
		cursoView.render()


# Events
$('button#create-curso-btn').click (event) ->
	event.preventDefault()
	form = $('form#create-curso-form').get()[0]
	nombre = form.nombre.value
	curso = new Curso {nombre: nombre}
	curso.save null, success: ->
		cursoList.fetch success: ->
			cursoView = new CursoListView {collection: cursoList}
			cursoView.render()
	form.reset()


# Curso model
class Curso extends Backbone.Model
	initialize: ->
		console.log 'Curso Initialized...'
		@on 'all', (e) -> console.log @get('nombre') + ' event: ' + e
	urlRoot: '/curso'

class CursoList extends Backbone.Collection
	initialize: ->
		console.log 'CursoList Initialized...'
		@on 'all', (e) -> console.log 'CursoList event: ' + e
	model: Curso
	url: '/curso'

class CursoListView extends Backbone.View
	initialize: ->
		console.log 'CursoListView Initialized...'
		@template = _.template cursoRowTemplate
	render: ->
		console.log 'CursoListView Rendered...'
		@$el.find('table tbody').empty()
		@renderRow curso for curso in @collection.models
	renderRow: (curso) ->
		console.log 'CursoListView ROW Rendered...'
		@$el.find('table tbody').append @template
			id: curso.id
			nombre: curso.get 'nombre'
			href: jsRoutes.controllers.Cursos.view(curso.id).url
	el: '#cursos-container' 

cursoRowTemplate = '
<tr>
	<td class="curso-id"><a href="<%=href%>"><%=id%></a></td>
	<td class="curso-nombre"><a href="<%=href%>"><%=nombre%></a></td>
</tr>
'

cursoList = new CursoList
