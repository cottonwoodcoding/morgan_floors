$ ->
  $(document).ready ->
    if (window.location.href.indexOf('testimonial') > -1)
      $('#testimonial-carousel').carousel()
  $('.add-testimonial').on 'click', ->
    $('#add_testimonial_modal').modal('show')

  $('.show-all').on 'click', ->
    $('.add-new-testimonial').addClass('hidden')
    $('.add-testimonial').removeClass('hidden')
    $('#testimonial-carousel').addClass('hidden')
    $('#testimonial_list').removeClass('hidden')
    $(@).addClass('hidden')
    $('.carousel-view').removeClass('hidden')
    $.ajax '/testimonial_list_view',
      type: 'get'
      success: (data) ->
        $('#testimonial_list').html(data)

  $('.carousel-view').on 'click', ->
    $('.add-new-testimonial').removeClass('hidden')
    $('.add-testimonial').addClass('hidden')
    $('#testimonial-carousel').removeClass('hidden')
    $('#testimonial_list').addClass('hidden')
    $(@).addClass('hidden')
    $('.show-all').removeClass('hidden')

