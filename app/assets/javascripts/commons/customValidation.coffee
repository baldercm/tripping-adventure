define [
  'app'
  'backbone.validation'
], (MainApp, Validation) ->
  'use strict'

  MainApp.on 'backbone:validation:custom:applyCallbacks', ->
    _.extend Validation.callbacks,
      valid: (view, attr, selector) ->
        control = view.$('[' + selector + '="' + attr + '"]')
        group = control.parents('.form-group')
        group.removeClass 'has-error'

        if control.data('error-style') == 'tooltip'
          # CAUTION: calling tooltip('hide') on an uninitialized tooltip causes bootstraps tooltips to crash somehow...
          control.tooltip 'hide' if control.data('tooltip')
        else if control.data('error-style') == 'inline'
          group.find('.help-inline.error-message').remove()
        else
          group.find('.help-block.error-message').remove()
        return

      invalid: (view, attr, error, selector) ->
        control = view.$('[' + selector + '="' + attr + '"]')
        group = control.parents '.form-group'
        group.addClass 'has-error'

        if control.data('error-style') == 'tooltip'
          position = control.data('tooltip-position') || 'right'
          control.tooltip
            placement: position
            trigger: 'manual'
            title: error
          control.tooltip 'show'
        else if control.data('error-style') == 'inline'
          if group.find('.help-inline').length == 0
            group.find('.form-control').after('<span class=\'help-inline error-message\'></span>')
          target = group.find '.help-inline'
          target.text error
        else
          if group.find('.help-block').length == 0
            group.find('.form-control').after('<p class=\'help-block error-message\'></p>')
          target = group.find '.help-block'
          target.text error
        return
    return

  return # end of define