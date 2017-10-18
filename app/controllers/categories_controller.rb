class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :destroy, :edit, :update]
  # before_action :set_job, only: [:index, :new, :create, :edit, :update]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create!(category_params)

    flash[:success] = "You created #{@category.title}"
    redirect_to category_path(@category)
  end

  def show
  end

  def edit
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)

    if @category.save
      flash[:success] = "You updated #{@category.title}"
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @category.destroy

    flash[:success] = "#{@category.title} was successfully deleted!"
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  def set_category
    @category = Category.find(params[:id])
  end

  # def set_job
  #   @job = Job.find(params[:job_id])
  # end
end
