class API::RecruitersController < ApplicationController
  before_action :authorized, only: [:auto_login]
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

  def login
    @recruiter = Recruiter.find_by(email: params[:email])

    if @recruiter && @recruiter.authenticate(params[:password])
      set_token
      render :show, status: :ok, location: api_url(@recruiter), locals: {token: @token}
    else
      render json: {error: "Invalid email or password"}
    end
  end

  def auto_login
    render :show, status: :ok, location: api_url(@recruiter)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_recruiter
    @recruiter = Recruiter.find(params[:id])
  end

  def set_token
    @token = encode_token({user_id: @recruiter.id})
  end

  # Only allow a list of trusted parameters through.
  def recruiter_params
    params.require(:recruiter).permit(:name, :email, :password)
  end
end
