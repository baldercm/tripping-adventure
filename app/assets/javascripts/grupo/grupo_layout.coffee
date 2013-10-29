define [
  'marionette'
  'tpl!templates/grupo/layout.tpl'
], (Marionette, layoutTpl) ->
  'use strict'

  GrupoLayout = Marionette.Layout.extend
    template: layoutTpl

  return GrupoLayout # end of define