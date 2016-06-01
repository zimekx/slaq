class ApplicationController < ActionController::Base
  attr_reader :current_user

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def authenticate_request!
    @current_user = Authenticator.new(encryptor, request).authenticate_user
  rescue ActiveRecord::RecordNotFound
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  def encryptor
    @encryptor ||= load_encryptor_from_config
  end

  def load_encryptor_from_config
    config = Rails.application.config_for("secrets")
    Encryptor.new(config["encryptor_key"], config["encryptor_salt"])
  end
end
