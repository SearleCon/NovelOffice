# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'mouseenter', '.scene-details', ->
     $(this).addClass('raised')

  $(document).on 'mouseleave', '.scene-details', ->
    $(this).removeClass('raised')


  $('.scene-list').sortable
    axis: 'y'
    stop: (e, ui) ->
      ui.item.children('li').effect('highlight', {}, 1000)
    update: (e, ui) ->
      scene_id = ui.item.data('sceneId')
      position = ui.item.index()
      $.ajax
        type: 'PATCH'
        url: ui.item.data('updateUrl')
        dataType: 'script'
        data: { id: scene_id, scene: { row_order_position: position } }


  $('#scenes').sortable
    axis: 'y'
    items: '.scene'
    stop: (e, ui) ->
      ui.item.children('.scene-details').effect('highlight', {}, 1000)
    update: (e, ui) ->
      scene_id = ui.item.data('sceneId')
      position = ui.item.index()
      $.ajax
        type: 'PATCH'
        url: ui.item.data('updateUrl')
        dataType: 'script'
        data: { id: scene_id, scene: { row_order_position: position } }






