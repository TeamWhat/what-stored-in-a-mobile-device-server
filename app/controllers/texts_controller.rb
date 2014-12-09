class TextsController < ApplicationController
  respond_to :html, except: :index
  before_action :set_text, only: [:show, :destroy]

  def index
    @texts = Text.all
    @text_count = Text.all.count
    respond_to do |format|
      format.html
      format.csv { send_data @texts.to_csv }
      format.xls
    end
  end

  def show
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
end
