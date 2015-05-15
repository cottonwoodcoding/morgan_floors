$ ->
  $('.edit-about').on 'click', ->
    $(@).addClass('hidden')
    $('.about-text').addClass('hidden')
    $('#edit_about_area').removeClass('hidden')
    $('.edit-about-text').val($('.about-text').attr('data-text'))

  $('#cancel_edit_about').on 'click', (e) ->
    e.preventDefault()
    $('.edit-about-text').val('')
    $('#edit_about_area').addClass('hidden')
    $('.edit-about').removeClass('hidden')
    $('.about-text').removeClass('hidden')

  if $('.alert').is(':visible')
    window.setTimeout (->
      $('.alert').fadeTo(500,0).slideUp 500, ->
        $(@).remove()
    ), 3000
