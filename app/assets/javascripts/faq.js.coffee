$ ->
  $(document).ready ->
    if (window.location.href.indexOf('faq') > -1)
      $('#faq_accordion').collapse()

  $('.add-question').on 'click', ->
    $('#add_question_modal').modal('show')

  $('.faq-panel').on 'click', ->
    $(@).find('.collapse').collapse('toggle')

  $('.faq-collapse').on 'shown.bs.collapse', ->
    arrow = $(@).siblings().find('.toggle-arrow')
    arrow.removeClass('fa-caret-right')
    arrow.addClass('fa-caret-down')

  $('.faq-collapse').on 'hidden.bs.collapse', ->
    arrow = $(@).siblings().find('.toggle-arrow')
    arrow.removeClass('fa-caret-down')
    arrow.addClass('fa-caret-right')
