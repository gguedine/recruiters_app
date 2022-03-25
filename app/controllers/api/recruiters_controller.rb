class API::RecruitersController < AuthorizationController
  before_action :authorized, except: %i[create]
  before_action :set_recruiter, only: %i[ show update destroy ]

  # GET /recruiters
  # GET /recruiters.json
  def index
    @recruiters = Recruiter.all
  end

  # GET /recruiters/1
  # GET /recruiters/1.json
  def show
  end

  # POST /recruiters
  # POST /recruiters.json
  def create
    @recruiter = Recruiter.new(recruiter_params)

    if @recruiter.save
      set_token
      render :show, status: :created, location: api_url(@recruiter), locals: {token: @token}
    else
      render json: @recruiter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recruiters/1
  # PATCH/PUT /recruiters/1.json
  def update
    if @recruiter.update(recruiter_params)
      set_token
      render :show, status: :ok, location: api_url(@recruiter), locals: {token: @token}
    else
      render json: @recruiter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recruiters/1
  # DELETE /recruiters/1.json
  def destroy
    render json: {data: @recruiter.destroy, message: "Deleted!"}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_recruiter
    @recruiter ||= Recruiter.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recruiter_params
    params.require(:recruiter).permit(:name, :email, :password)
  end
end
