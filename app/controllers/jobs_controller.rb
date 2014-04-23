class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @job = Job.all
  end

  def show
  end

  def new
    @job = current_user.jobs.build
  end

  def edit
  end

  def create
    @job = current_user.jobs.build(job_params)
    if @job.save
      redirect_to @job, notice: 'Job was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @job.update(job_params)
      redirect_to @job, notice: 'Job was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job = Job.find(params[:id])
  end

  def correct_user
  @job = current_user.jobs.find_by(id: params[:id])
    redirect_to jobs_path, notice: "Not autorized ti edit this Job" if @job.nil?
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def job_params
    params.require(:job).permit(:description, :image)
  end
end
