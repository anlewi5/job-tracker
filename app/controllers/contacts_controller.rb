class ContactsController < ApplicationController
  before_action :set_company, only: [:new, :create]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.company_id = params[:company_id]

    @contact.save

    flash[:success] = "You added #{@contact.first_name} #{@contact.last_name} to #{@company.name}"
    redirect_to company_path(@contact.company)
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :position, :email)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end
end
