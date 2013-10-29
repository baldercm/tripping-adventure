define [
  'app'
  'tpl!templates/cursoLayout.tpl'
  'tpl!templates/curso.tpl'
  'tpl!templates/cursos.tpl'
  'tpl!templates/cursoToolbar.tpl'
  'tpl!templates/cursoForm.tpl'
  'backbone.syphon'
], (MainApp, layoutTpl, itemTpl, listTpl, toolbarTpl, formTpl) ->
  'use strict'

  MainApp.module 'CursoApp.View', (View, MainApp, Backbone, Marionette, $, _) ->
    class View.Layout extends Marionette.Layout
      template: layoutTpl
      regions:
        toolbarRegion: '#toolbar-region'
        formRegion: '#form-region'
        listRegion: '#list-region'

    class View.Toolbar extends Marionette.ItemView
      template: toolbarTpl
      events:
        'click #new' : 'newClicked'
      newClicked: (e) ->
        e.preventDefault()
        @trigger 'curso:new'
        return

    class View.Item extends Marionette.ItemView
      template: itemTpl
      events:
        'click a.edit' : 'editClicked'
      tagName:   'tr'
      className: 'curso-view'
      editClicked: (e) ->
        e.preventDefault()
        @trigger 'curso:edit', @model
        return

    class View.List extends Marionette.CompositeView
      template: listTpl
      itemView: View.Item
      itemViewContainer: 'tbody'
      appendHtml: (collectionView, itemView, index) ->
        childrenContainer = (if collectionView.itemViewContainer then collectionView.$(collectionView.itemViewContainer) else collectionView.$el)
        children = childrenContainer.children()
        if children.size() <= index
          childrenContainer.append itemView.el
        else
          childrenContainer.children().eq(index).before itemView.el
        return

    class View.Form extends Marionette.ItemView
      template: formTpl
      initialize: ->
        Backbone.Validation.bind this
        return
      onClose: ->
        Backbone.Validation.unbind this
        return
      events:
        'click #save': 'saveClicked'
        'click #back': 'backClicked'
      saveClicked: (e) ->
        e.preventDefault()
        data = Backbone.Syphon.serialize this
        @trigger "curso:save", data
        return
      backClicked: (e) ->
        e.preventDefault()
        @trigger "curso:back"
        return

    return # end of module

  return MainApp.CursoApp.View # end of define