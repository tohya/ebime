# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  size = $('#jissekis .date').length
  width = $('#jissekis .date').outerWidth()
  $('#jissekis #door').width(size * width)

$ ->
  $('.time-list button').click ->
    # parent = $('.time-list button').parent().parent().parent()
    # alert(parent.hasClass("date"))
    # alert(parent.get(0).className)

    # 選択されたボタンの番目(ページ全体で)(0始まり)
    button_index = $('.time-list button').index(this)
    # 1日分のボタンの数 = 全体のボタンの数 / 日付ごとの列の数
    tllr_size = $('.time-list button').length / $('.date').length
    # 選択されたボタンの所属する日付の番目(0始まり)
    date_index = Math.floor( button_index / tllr_size) # 切り捨て
    # 選択されたボタンの番目(所属する日付列内で)
    #button_index = button_index_in_all % tllr_size

    #alert(project)
    #day.indexOf("日")
    month = $('#month').find('#target-month').text().slice(0,1)
    day = $('.day').eq(date_index).text().slice(0,1)
    project = $('.project').eq(date_index).text()
    time = $('.time-list button').eq(button_index).text()

    $('.time').eq(date_index).text(time+"h")
    $('.time-list').eq(date_index).children().children("button").removeAttr("btn-warning").attr("class":"btn btn-info btn-xs")
    $('.time-list button').eq(button_index).removeAttr("btn-info").attr("class":"btn btn-warning btn-xs")

    $.post("/jisseki", month: month, day: day, project: project,time: time)
    
###

    $.ajax
      type: 'POST'
      url: "/jisseki"
      data:
        remote: true
        month: month
        day: day
        project: project
        time: time

    $.post
      url: "/jissekis"
      form:
        month: month
        day: day
        project: project
        time: time
###



