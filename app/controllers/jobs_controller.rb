class JobsController < ApplicationController
  before_action :set_job, only: [:show, :destroy, :edit]
  before_action :set_company, only: [:index, :new, :create, :edit, :update]

  def index
    @jobs = @company.jobs
  end

  def new
    @job = Job.new()
  end

  def create
    @job = @company.jobs.new(job_params)

    flash[:success] = "You created #{@job.title} at #{@company.name}"
    redirect_to company_job_path(@company, @job)
  end

  def show
  end

  def edit
  end

  def update
    @job = @company.jobs.find(params[:id])
    @job.update(job_params)

    flash[:success] = "You updated #{@job.title} at #{@company.name}"
    redirect_to company_job_path(@company, @job)
  end

  def destroy
    @job.destroy

    flash[:success] = "#{@job.title} was successfully deleted!"
    redirect_to companies_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
