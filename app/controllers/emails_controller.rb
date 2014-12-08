class EmailsController < ApplicationController
  respond_to :html, except: :index
  before_action :set_email, only: [:destroy]

  def index
    @emails = Email.all
    @email_count = Email.all.count
    respond_to do |format|
      format.html
      format.csv { send_data @emails.to_csv }
      format.xls
    end
  end

  def destroy
    @email.destroy
    respond_with(@email)
  end

  private

  def set_email
    @email = Email.find(params[:id])
  end
end
