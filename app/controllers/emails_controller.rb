class EmailsController < ApplicationController
  respond_to :html, :json, except: :index
  before_action :set_email, only: [:show, :edit, :update, :destroy]

  def index
    @emails = Email.all
    @email_count = Email.all.count
    respond_to do |format|
      format.html
      format.csv { send_data @emails.to_csv }
      format.xls
    end
  end

  def show
    respond_with(@email)
  end

  def new
    @email = Email.new
    respond_with(@email)
  end

  def edit
  end

  def create
    @email = Email.new(email_params)
    @email.save
    respond_with(@email)
  end

  def update
    @email.update(email_params)
    respond_with(@email)
  end

  def destroy
    @email.destroy
    respond_with(@email)
  end

  private

  def set_email
    @email = Email.find(params[:id])
  end

  def email_params
    params.require(:email).permit(:email)
  end
end
