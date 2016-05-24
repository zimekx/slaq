class AuthenticationController < ApplicationController
  def authenticate_user
    user = User.find_for_database_authentication(email: params[:email])
    if user && user.valid_password?(params[:password])
      render json: {auth_token: encryptor.encrypt(user.id) }
    else
      render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
    end
  end
end
