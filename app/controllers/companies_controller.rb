class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :destroy, :edit, :update]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    flash[:success] = "#{@company.name} added!"
    redirect_to company_path(@company)
  end

  def show
    redirect_to company_jobs_path(@company)
  end

  def edit
  end

  def update
    @company.update(company_params)

    flash[:success] = "#{@company.name} updated!"
    redirect_to company_path(@company)
  end

  def destroy
    @company.destroy

    flash[:success] = "#{@company.name} was successfully deleted!"
    redirect_to companies_path
  end


  private

  def company_params
    params.require(:company).permit(:name, :city)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
