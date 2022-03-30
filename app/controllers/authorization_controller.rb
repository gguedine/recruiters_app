class AuthorizationController < ActionController::API

  def encode_token(payload)
    #payload[:exp] = (15).minutes.from_now.to_i #expire in 15 minutes
    JWT.encode(payload, ENV['SECRET'])
  end

  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1] || auth_header
      # header: { 'Authorization': 'Bearer <token>' } ||
      begin
        JWT.decode(token, ENV['SECRET'], true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @recruiter = Recruiter.find_by(id: user_id)
    end
  end

  def logged_in?
    !!logged_in_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

  def set_token
    @token = encode_token({user_id: @recruiter.id})
  end

  def api_url(object)
    #ex: "api/recruiters/jobs" -> [:api,:recruiters, object]
    params = controller_path.split("/")[0...-1].map(&:to_sym) << object
    url_for(params)
  end
end