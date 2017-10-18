class ContactsController < ApplicationController
  before_action :set_company, only: [:new, :create]

  def new
    @contact = Comment.new
  end

  def create
    @contact = Comment.new(contact_params)
    @contact.company_id = params[:company_id]

    @contact.save

    flash[:success] = "You added #{@contact.first_name} #{@contact.last_name} to #{@company.name}"
    redirect_to company_path(@contact.company)
  end

  private

  def contact_params
    params.require(:contact).permit(:content)
  end

  def set_company
    @company = Job.find(params[:company_id])
  end
end
