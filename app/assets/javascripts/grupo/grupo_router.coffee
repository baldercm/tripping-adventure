define [
  'marionette'
], (Marionette) ->
  'use strict'

  GrupoRouter = Marionette.AppRouter.extend
    appRoutes:
      'grupos': 'listGrupos'
      'grupos/:id': 'showGrupo',
      'grupos/:id/edit': 'editGrupo'

  return GrupoRouter # end of define