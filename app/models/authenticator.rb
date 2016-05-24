class Authenticator
  def initialize(encryptor, request)
    @encryptor = encryptor
    @request = request
  end

  def authenticate_user
    if user_id_in_token?
      begin
      return User.find(auth_token)
      rescue ActiveRecord::RecordNotFound
      end
    end

    fail Exceptions::InvalidToken
  end

  private

  def http_token
      @http_token ||= if @request.headers['Authorization'].present?
        @request.headers['Authorization'].split(' ').last
      end
  end

  def auth_token
    @auth_token ||= @encryptor.decrypt(http_token).to_i
  end

  def user_id_in_token?
    http_token && auth_token
  end
end
