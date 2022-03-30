class API::Public::JobsController < ApplicationController
  before_action :set_job, only: :show

  # GET api/public/jobs
  # GET api/public/jobs?title=abc&description=cba
  # GET api/public/jobs.json
  def index
    @jobs = Job.filter(filtering_params)
  end

  # GET api/public/jobs/1
  # GET api/public/jobs/1.json
  def show
  end

  private
  def set_job
    @job = Job.find(params[:id])
  end

  def filtering_params
    params.slice(:title, :description, :start_date, :end_date, :skills)
  end

end