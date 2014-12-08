class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :destroy]

  # GET /collections
  def index
    @collections = Collection.all
  end

  # GET /collections/1
  def show
    @audio_count = @collection.audios.count
    @image_count = @collection.images.count
    @text_count = @collection.texts.count
    @video_count = @collection.videos.count
    @application_count = @collection.applications.count
  end

  # DELETE /collections/1
  def destroy
    @collection.destroy
    respond_to do |format|
      format.html { redirect_to collections_url, notice: 'Collection was successfully destroyed.' }
    end
  end

  private

  def set_collection
    @collection = Collection.find(params[:id])
  end
end
