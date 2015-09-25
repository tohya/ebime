# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  size = $('#jissekis .date').length;
  width = $('#jissekis .date').outerWidth();
  $('#jissekis #door').width(size * width);

$ ->
  $('.time-list button').click ->
    alert($('.time-list button').index(this));
    tllr = 2 * $('.tll').length / $('.date').length;
    alert($('.time-list button').index(this) / tllr);
    alert($('.time-list button').index(this) % tllr);
    
    # parent = $('.time-list button').parent().parent().parent();
    # alert(parent.hasClass("date"));
    # alert(parent.get(0).className);

    parent = $('.time-list button').parent().parent();

