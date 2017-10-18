class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :destroy, :edit]
  before_action :set_company, only: [:index, :new, :create, :edit, :update]

  def index
    @contacts = @company.contacts
  end

  def new
    @contact = Comment.new
  end

  def create
    @contact = Comment.new(contact_params)
    @contact.company_id = params[:company_id]

    @contact.save

    flash[:success] = "You said #{@contact.content} about #{@company.title}"
    redirect_to company_path(@contact.company)
  end

  def show
    @contact = @article.contacts.new
  end

  def edit
  end

  def update
    @contact = @company.contacts.find(params[:id])
    @contact.update(contact_params)

    if @company.save
      flash[:success] = "You said #{@contact.content} about #{@company.title}"
      redirect_to company_contact_path(@company, @contact)
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy

    flash[:success] = "#{@contact.content} was successfully deleted!"
    redirect_to companys_path
  end

  private

  def contact_params
    params.require(:contact).permit(:content)
  end

  def set_company
    @company = Job.find(params[:company_id])
  end

  def set_contact
    @contact = Comment.find(params[:id])
  end
end
