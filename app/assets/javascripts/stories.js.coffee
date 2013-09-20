# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
 $(document).on 'click', '.story-details', ->
   window.location.href  = $(this).data('path');

 $(document).on 'mouseenter', '.story-details', ->
  $(this).addClass('raised')

 $(document).on 'mouseleave', '.story-details', ->
  $(this).removeClass('raised')

