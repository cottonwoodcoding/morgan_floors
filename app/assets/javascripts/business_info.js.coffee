$ ->
  $('.add_phone').click ->
    $.ajax '/other_phone',
      type: 'GET'
      success: (data) ->
        $('#primary_phone').after(data)

  $(document).on 'click', '.remove_phone', ->
    $(@).closest('.other_phone').remove()