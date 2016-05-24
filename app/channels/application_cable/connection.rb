# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = Authenticator.new(encryptor, request).authenticate_user
    rescue Exceptions::InvalidToken
      reject_unauthorized_connection
    end

    private

    def encryptor
      @encryptor ||= load_encryptor_from_config
    end

    def load_encryptor_from_config
    config = Rails.application.config_for("secrets")
    Encryptor.new(config["encryptor_key"], config["encryptor_salt"])
    end
  end
end
