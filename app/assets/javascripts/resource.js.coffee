$ ->
  $('.add-video').on 'click', ->
    $('#add_videos_modal').modal('show')

  $(document).ready ->
    if (window.location.href.indexOf('resource') > -1)
      $('#carousel').elastislide(minItems: 3)

  $('.trash-vid').on 'click', ->
    id = $(@).attr('data-id')
    $.ajax '/delete_video',
      type: 'DELETE'
      data:
        id: id
      success: ->
        window.location.reload()

  $('.alternate-vid').on 'click', ->
    id = $(@).attr('data-id')
    $.ajax '/main_video',
      type: 'POST'
      data:
        id: id
      success: ->
        window.location.reload()

  $('.vid-thumb').on 'click', (e) ->
    e.preventDefault()
    thumb = $(@).children('img')
    id = thumb.attr('vid-id')
    $.ajax '/video_description',
      type: 'GET'
      data:
        id: id
      success: (data) ->
        $('.video-description').text(data.description)
      error: ->
        $('.video-description').text('')

    key = thumb.attr('vid-key')
    frame = $('#video_player')
    frame[0].contentWindow.location.href = "https://www.youtube.com/embed/#{key}"

  $('.add-link').on 'click', ->
    $('#add_link_modal').modal('show')

  $('.upable').on 'click', ->
    id = $(@).parent('.link-control-container').attr('data-id')
    $.ajax '/link_up',
      type: 'POST'
      data:
        id: id
      success: ->
        window.location.reload()

  $('.downable').on 'click', ->
    id = $(@).parent('.link-control-container').attr('data-id')
    $.ajax '/link_down',
      type: 'POST'
      data:
        id: id
      success: ->
        window.location.reload()
