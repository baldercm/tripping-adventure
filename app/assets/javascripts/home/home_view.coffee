define [
  'marionette'
  'tpl!templates/home/home.tpl'
], (Marionette, homeTpl) ->
  'use strict'

  HomeView = Marionette.ItemView.extend
    template: homeTpl

  return HomeView # end of define