# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  date = $('#kintais .date').length;
  width = $('#kintais .date').outerWidth(true);
  $('#kintais #door').width(date * width);
