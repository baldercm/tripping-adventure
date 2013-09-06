# Onload
$ ->
	cursoView = new CursoView
	cursoView.model = new Curso
	cursoView.render()
	
	cursoList.fetch success: ->
		cursoListView = new CursoListView {collection: cursoList}
		cursoListView.render()


# Curso model
class Curso extends Backbone.Model
	initialize: ->
		console.log 'Curso Initialized...'
		@on 'all', (e) -> console.log @get('nombre') + ' event: ' + e
	url: '/curso'
	urlRoot: '/curso'

class CursoList extends Backbone.Collection
	initialize: ->
		console.log 'CursoList Initialized...'
		@on 'all', (e) -> console.log 'CursoList event: ' + e
	model: Curso
	url: '/curso'

class CursoView extends Backbone.View
	initialize: ->
		console.log 'CursoView Initialized...'
		#@on 'all', (e) -> console.log 'CursoView event: ' + e
	events: ->
		"click button.post": "create",
		"click button.put" : "update"
	create: (e) ->
		console.log 'CursoView create()...'
		e.preventDefault()
		form = $('form#create-curso-form').get()[0]
		nombre = form.nombre.value
		curso = new Curso {nombre: nombre}
		curso.save null, success: ->
			cursoList.fetch success: ->
				cursoView = new CursoListView {collection: cursoList}
				cursoView.render()
		form.reset()
		cursoRouter.navigate 'list'
	update: (e) ->
		console.log 'CursoView update()...'
		e.preventDefault()
		form = $('form#create-curso-form').get()[0]
		nombre = form.nombre.value
		curso = new Curso {nombre: nombre}
		curso.save null, success: ->
			cursoList.fetch success: ->
				cursoView = new CursoListView {collection: cursoList}
				cursoView.render()
		form.reset()
		cursoRouter.navigate 'list'
	render: ->
		console.log 'CursoView Rendered...'
		nombre = @model.get 'nombre'
		id = @model.id
		@$el.empty()
		@$el.append @template
			action: if id then "#update/#{id}" else '#create'
			method: if id then 'put' else 'post'
			label:  if id then 'Actualizar' else 'Crear'
			icon:   if id then 'icon-ok' else '"icon-plus'
			nombre: @model.get 'nombre'
			id:     id
	el: '#form-curso-container'
	template: _.template '
		<form action="<%=action%>" method="<%=method%>" id="create-curso-form">
			<fieldset>
	    		<legend>Crear Curso</legend>
				<div class="control-group" id="nombre_field">
					<label class="control-label" for="nombre">Nombre</label>
					<div class="controls">
						<input type="text" value="<%=nombre%>" name="nombre" id="nombre">
						<span class="help-inline"></span>
					</div>
				</div>
				<input type="hidden" value="<%=id%>" name="id" id="id">
		    	<button id="create-curso-btn" type="submit" class="btn btn-success <%=method%>"><i class="<%=icon%> icon-white"></i> <%=label%></button>
	    	</fieldset>
		</form>' 

class CursoListView extends Backbone.View
	initialize: ->
		console.log 'CursoListView Initialized...'
		#@on 'all', (e) -> console.log 'CursoListView event: ' + e
	render: ->
		console.log 'CursoListView Rendered...'
		@$('table tbody').empty()
		@renderRow curso for curso in @collection.models
	renderRow: (curso) ->
		@$('table tbody').append @template
			id: curso.id
			nombre: curso.get 'nombre'
			href: "#view/#{curso.id}"
	el: '#list-curso-container'
	template: _.template '
		<tr>
			<td class="curso-id"><a href="<%=href%>"><%=id%></a></td>
			<td class="curso-nombre"><a href="<%=href%>"><%=nombre%></a></td>
		</tr>' 

cursoList = new CursoList

# Router
class CursoRouter extends Backbone.Router
	routes:
		"create" : "create",
		"view/:id" : "view",
	create: ->
		console.log "ROUTING #create"
	view: (cursoId) ->
		console.log "ROUTING #view/#{cursoId}"
		cursoView.remove()
		cursoView = new CursoView
		cursoView.model = cursoList.get cursoId
		cursoView.render()
 
cursoRouter = new CursoRouter
Backbone.history.start()