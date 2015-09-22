$ ->
  $('.time-list button').click ->
    alert("Hello World!")

$ ->
  speed = 200;
  $('#slider').mousewheel (event, mov) ->
    $(@).scrollLeft $(@).scrollLeft() - mov * speed
    return false;
