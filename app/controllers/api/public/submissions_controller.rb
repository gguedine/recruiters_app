class API::Public::SubmissionsController < ApplicationController

  # POST api/public/submissions
  # POST api/public/submissions.json
  def create
    @submission = Submission.new(submission_params)
    if @submission.save
      render :show, status: :created
    else
      render json: @submission.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def submission_params
      params.require(:submission).permit(:name, :email, :mobile_phone, :resume, :job_id)
    end
end
