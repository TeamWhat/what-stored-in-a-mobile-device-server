class TextsController < ApplicationController
  respond_to :html, :json, except: :index
  before_action :set_text, only: [:show, :edit, :update, :destroy]

  def index
    @texts = Text.all
    respond_to do |format|
      format.html
      format.csv { send_data @texts.to_csv }
      format.xls
    end
  end

  def show
    respond_with(@text)
  end

  def new
    @text = Text.new
    respond_with(@text)
  end

  def edit
  end

  def create
    @text = Text.new(text_params)
    @text.save
    respond_with(@text)
  end

  def update
    @text.update(text_params)
    respond_with(@text)
  end

  def destroy
    @text.destroy
    respond_with(@text)
  end

  private

  def set_text
    @text = Text.find(params[:id])
  end

  def text_params
    params.require(:text).permit(:date, :size, :date_modified, :date_added, :mime_type)
  end
end
