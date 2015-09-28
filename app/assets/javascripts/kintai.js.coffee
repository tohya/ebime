# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  size = $('#kintais .date').length;
  width = $('#kintais .date').outerWidth() + $('#kintais .space').outerWidth();
  $('#kintais #door_k').width(size * width);

  $ ->
  speed = 200;
  $('#slider').mousewheel (event, mov) ->
    $(@).scrollLeft $(@).scrollLeft() - mov * speed
    return false;
