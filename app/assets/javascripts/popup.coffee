class ConfirmationPopup

  constructor: ->
    $('*[data-trigger-popup]').on('click', (event) ->
      event.preventDefault()
      $(document).foundation('joyride', 'start')
    )

$(->new ConfirmationPopup())
