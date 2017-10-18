class CommentsController < ApplicationController
  before_action :set_job, only: [:new, :create]

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

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_job
    @job = Job.find(params[:job_id])
  end
end
