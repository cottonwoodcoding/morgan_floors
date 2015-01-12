$ ->
  $(document).ready ->
    if (window.location.href.indexOf('gallery') > -1)
      $('.carousel').carousel()
      $(document).on 'click', '.gallery-panel', ->
        $(@).siblings('.collapse').collapse('toggle')
      $('.panel-heading').each ->
        id = $(@).attr('id').split("_")[1]
        $("#album_thumbs_#{id}").elastislide(minItems: 3)

  $(document).on 'click', '.img-thumb', (e) ->
    e.preventDefault()
    e.stopPropagation()
    number = parseInt($(@).attr('data-id'))
    player = $(@).closest('.collapse').find('.carousel')
    player.carousel(number)
