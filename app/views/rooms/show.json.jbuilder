json.rooms(@rooms) do |room|
  json.extract! room, :id, :name
  json.messages(@messages[room.id]) do |message|
    json.partial! 'messages/message', message: message
  end
end

