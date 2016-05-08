App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append("<p>#{data['message']['content']}</p>")

  speak: (message)->
    @perform 'speak', message: message

$(document).on 'keypress', '[data-behavior~=room_speaker]', (e) ->
  if e.keyCode is 13
    App.room.speak(e.target.value)
    e.target.value = ''
    e.preventDefault()
