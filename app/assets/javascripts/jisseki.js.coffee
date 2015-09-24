# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  size = $('#jissekis .date').length;
  width = $('#jissekis .date').outerWidth();
  $('#jissekis #door').width(size * width);
  