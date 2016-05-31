class JobsController < ApplicationController
  before_action :authenticate_jobs_user!

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.friendly.find(params[:id])
  end
end
