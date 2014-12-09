class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :destroy]

  # GET /images
  def index
    @images = Image.all
    @image_count = Image.all.count
    respond_to do |format|
      format.html
      format.csv { send_data @images.to_csv }
      format.xls
    end
  end

  # GET /images/1
  def show
  end

  # DELETE /images/1
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
    end
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end
end
