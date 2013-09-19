# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
 $(document).on 'click', '.linked_story', ->
   window.location.href  = $(this).data('path');

 $(document).on 'mouseenter', '.well_shadow', ->
  $(this).addClass('raised')

 $(document).on 'mouseleave', '.well_shadow', ->
  $(this).removeClass('raised')

