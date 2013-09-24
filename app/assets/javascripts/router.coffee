define ["marionette"], (Marionette) ->
	"use strict"
	Marionette.AppRouter.extend
		routes:
			":id/edit" : "edit"
		edit: ->
			console.log "Router.edit()"