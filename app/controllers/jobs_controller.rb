class JobsController < ApplicationController
  before_action :set_job, only: [:show, :destroy, :edit]
  before_action :set_company, only: [:new, :create, :edit, :update]

  def index
    # binding.pry
    if params[:company_id]
      @company = Company.find(params[:company_id])
      @jobs = @company.jobs
    elsif params[:category_id]
      @category = Category.find(params[:category_id])
      @jobs = Job.where(category: params[:category])
    elsif params["sort"] == "interest"
      @jobs = Job.order("level_of_interest desc")
    elsif params["sort"]
      @jobs = Job.order(:city)
    elsif params["location"]
      @jobs = Job.where(city: params["location"])
    else
      @jobs = Job.all
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = @company.jobs.create!(job_params)

    flash[:success] = "You created #{@job.title} at #{@company.name}"
    redirect_to company_job_path(@company, @job)
  end

  def show
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit
  end

  def update
    @job = @company.jobs.find(params[:id])
    @job.update(job_params)

    if @company.save
      flash[:success] = "You updated #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    @job.destroy

    flash[:success] = "#{@job.title} was successfully deleted!"
    redirect_to companies_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
