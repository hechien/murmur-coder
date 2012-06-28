# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  submit_button = $('form#new_murmur input[name="commit"]')
  submit_button_origin_value = submit_button.val()

  $('form#new_murmur')
  .bind 'ajax:beforeSend', (e, xhr, settings) ->
    submit_button.val("正在送啦")

  .bind 'ajax:success', (e, data, status, xhr) ->
    $(this).get(0).reset()
    $("#murmurs-list").html(xhr.responseText)

  .bind 'ajax:complete', (e, xhr, status) ->
    submit_button.val(submit_button_origin_value)

  .bind 'ajax:error', (e, xhr, status, error) ->
    form = $(this)
    [errors, errorText] = [null, null]
    try
      errors = $.parseJSON xhr.responseText
    catch err
      errors = {message: "可能 ... 主機被我的貓拿來當玩具玩了吧？"}

    errorText = "呃，是有一些錯誤啦 ... \n<ul>"

    for error in errors
      errorText += "<li>#{error}: #{errors[error]}</li>"

    errorText += "</ul>"

    form.find('div.error_explanation').html(errorText)