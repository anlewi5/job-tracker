class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :destroy, :edit]
  before_action :set_job, only: [:index, :new, :create, :edit, :update]

  def index
    @comments = @job.comments
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.job_id = params[:job_id]

    @comment.save

    flash[:success] = "You said #{@comment.content} about #{@job.title}"
    redirect_to job_path(@comment.job)
  end

  def show
  end

  def edit
  end

  def update
    @comment = @job.comments.find(params[:id])
    @comment.update(comment_params)

    if @job.save
      flash[:success] = "You said #{@comment.content} about #{@job.title}"
      redirect_to job_comment_path(@job, @comment)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy

    flash[:success] = "#{@comment.content} was successfully deleted!"
    redirect_to jobs_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_job
    @job = Job.find(params[:job_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
