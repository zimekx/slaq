# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'room_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    user_id = encryptor.decrypt(data['login']['token']).to_i
    user = User.find(user_id)
    Message.create!(
      content: data['message'],
      room_id: data['room_id'],
      user: user
    )
  end

  private

  def load_encryptor_from_config
    config = Rails.application.config_for("secrets")
    Encryptor.new(config["encryptor_key"], config["encryptor_salt"])
  end

  def encryptor
    @encryptor ||= load_encryptor_from_config
  end
end
