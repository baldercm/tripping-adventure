define [
  'marionette'
], (Marionette) ->
  'use strict'

  GrupoRouter = Marionette.AppRouter.extend
    appRoutes:
      'home': 'welcome'

  return GrupoRouter # end of define