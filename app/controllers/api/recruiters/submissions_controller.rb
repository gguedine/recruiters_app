class API::Recruiters::SubmissionsController < AuthorizationController
  before_action :authorized
  before_action :set_submission, only: %i[show update destroy]

  # GET api/recruiters/submissions
  # GET api/recruiters/submissions.json
  def index
    @submissions = Submission.all
  end

  # GET api/recruiters/submissions/1
  # GET api/recruiters/submissions/1.json
  def show; end

  # POST api/recruiters/submissions
  # POST api/recruiters/submissions.json
  def create
    @submission = Submission.new(submission_params)

    if @submission.save
      render :show, status: :created, location: api_url(@submission)
    else
      render json: @submission.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/recruiters/submissions/1
  # PATCH/PUT api/recruiters/submissions/1.json
  def update
    if @submission.update(submission_params)
      render :show, status: :ok, location: api_url(@submission)
    else
      render json: @submission.errors, status: :unprocessable_entity
    end
  end

  # DELETE api/recruiters/submissions/1
  # DELETE api/recruiters/submissions/1.json
  def destroy
    @submission.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_submission
    @submission = Submission.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def submission_params
    params.require(:submission).permit(:name, :email, :mobile_phone, :resume,
                                       :job_id)
  end
end
