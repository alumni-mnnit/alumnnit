class JobsController < ApplicationController
  before_action :require_user, except: [:index, :show]
  before_action :find_job , only: [:show, :edit, :update, :destroy]
  def index
    @jobs = Job.order('created_at DESC').page params[:page].per(3)
  end

  def new
    @job = current_user.jobs.build
  end

  def create
    @job = current_user.jobs.build(job_params)
    if @job.save
      flash[:notice] = "Job added successfully!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to @job, notice: "Job was Successfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @job.destroy
    redirect_to root_path
  end

  private
  def require_user
    unless current_user 
      flash[:alert] = "You need to Login/Signup to enjoy all facilities."
      redirect_to "/" and return
    end
    if current_user.is_active == false
      redirect_to "/" and return
    end
  end

  def job_params
    params.require(:job).permit(:title, :description, :url)
  end

  def find_job
      @job = Job.find(params[:id])
  end
end
