class API::Recruiters::JobsController < AuthorizationController
  before_action :authorized
  before_action :set_job, only: %i[ show update destroy ]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params.merge!(recruiter_id: @recruiter.id))

    if @job.save
      render "api/jobs/show", status: :created , location: api_url(@job)
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    if @job.update(job_params.merge!(recruiter_id: @recruiter.id))
      render :show, status: :ok, location: api_url(@job)
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.require(:job).permit(:title, :description, :start_date, :end_date, :status, :skills)
    end
end
