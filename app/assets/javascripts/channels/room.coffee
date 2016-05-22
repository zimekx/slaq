App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data);
    $('#room_' + data['message']['room_id'] + ' .messages').append("<p>" + data['message']['content'] + "</p>");

  speak: (message, roomId)->
    @perform 'speak', {message: message, room_id: roomId}

$(document).on 'keypress', '[data-behavior~=room_speaker]', (e) ->
  if e.keyCode is 13
    roomId = $(e.target).data('room-id')
    App.room.speak(e.target.value, roomId)
    e.target.value = ''
    e.preventDefault()
