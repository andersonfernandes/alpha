$(document).on 'page:change', ->
  $('.flash').on 'click', '.close', ->
    $('.flash .alert').slideUp(400)
