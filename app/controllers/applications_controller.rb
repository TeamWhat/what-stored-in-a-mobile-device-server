class ApplicationsController < ApplicationController
  respond_to :html, :json, except: :index
  before_action :set_application, only: [:show, :edit, :update, :destroy]

  def index
    @applications = Application.all
    respond_to do |format|
      format.html
      format.csv { send_data @applications.to_csv }
      format.xls
    end
  end

  def show
    respond_with(@application)
  end

  def new
    @application = Application.new
    respond_with(@application)
  end

  def edit
  end

  def create
    @application = Application.new(application_params)
    @application.save
    respond_with(@application)
  end

  def update
    @application.update(application_params)
    respond_with(@application)
  end

  def destroy
    @application.destroy
    respond_with(@application)
  end

  private
    def set_application
      @application = Application.find(params[:id])
    end

    def application_params
      params.require(:application).permit(:label, :package_name, :first_installed, :version_name, :target_sdk_version)
    end
end
