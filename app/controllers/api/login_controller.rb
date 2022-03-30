class API::LoginController < AuthorizationController
  before_action :authorized, except: %i[login]
  before_action :login_params, only: %i[login]

  def login
    @recruiter = Recruiter.find_by(email: params[:email])
    if @recruiter&.authenticate(params[:password])
      set_token
      render "api/recruiters/show", status: :ok, location: api_url(@recruiter),
                                    locals: { token: @token }
    else
      render json: { error: "Invalid email or password" },
             status: :unprocessable_entity
    end
  end

  def auto_login
    render "api/recruiters/show", status: :ok, location: api_url(@recruiter)
  end

  private

  def login_params
    params.require([:email, :password])
  end
end
