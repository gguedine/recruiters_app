class AuthorizationController < ActionController::API
  def encode_token(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.secret_key_base)
  end

  def auth_header
    # { Authorization: 'Bearer <token>' }
    return request.headers["Authorization"] if request.headers["Authorization"].present?

    @errors ||= { message: "Missing token!" }
    false
  end

  def decoded_token
    if auth_header
      token = auth_header.split[1] || auth_header
      # header: { 'Authorization': 'Bearer <token>' }
      begin
        JWT.decode(token, Rails.application.secret_key_base, true,
                   algorithm: "HS256")
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in_user
    if decoded_token
      user_id = decoded_token[0]["user_id"]
      @recruiter ||= Recruiter.find_by(id: user_id)
    else
      @errors ||= { message: "Invalid token!" }
      false
    end
  end

  def logged_in?
    logged_in_user
  end

  def authorized
    unless logged_in?
      render json: @errors,
             status: :unauthorized
    end
  end

  def set_token(_exp = 24.hours.from_now)
    @token = encode_token({ user_id: @recruiter.id }, exp = 24.hours.from_now)
  end

  def api_url(object)
    # ex: "api/recruiters/jobs" -> [:api,:recruiters, object]
    params = controller_path.split("/")[0...-1].map(&:to_sym) << object
    url_for(params)
  end
end
