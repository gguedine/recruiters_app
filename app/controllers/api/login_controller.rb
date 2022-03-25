class API::LoginController < AuthorizationController
  before_action :authorized, except: %i[login]
  before_action :login_params, except: %i[auto_login]

  def login
    @recruiter = Recruiter.find_by(email: params[:email])

    if @recruiter && @recruiter.authenticate(params[:password])
      set_token
      render 'api/recruiters/show', status: :ok, location: api_url(@recruiter), locals: {token: @token}
    else
      render json: {error: "Invalid email or password"}
    end
  end

  def auto_login
    render :show, status: :ok, location: api_url(@recruiter)
  end

  private

  def login_params
    params.require([:email,:password])
  end
end