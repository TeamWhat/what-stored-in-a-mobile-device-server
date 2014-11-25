class VideosController < ApplicationController
  respond_to :html, :json, except: :index
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def index
    @videos = Video.all
    respond_to do |format|
      format.html
      format.csv { send_data @videos.to_csv }
      format.xls
    end
  end

  def show
    respond_with(@video)
  end

  def new
    @video = Video.new
    respond_with(@video)
  end

  def edit
  end

  def create
    @video = Video.new(video_params)
    @video.save
    respond_with(@video)
  end

  def update
    @video.update(video_params)
    respond_with(@video)
  end

  def destroy
    @video.destroy
    respond_with(@video)
  end

  private
    def set_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:tags, :album, :resolution, :size, :category, :duration, :date_added, :date_modified, :date_taken, :description, :is_private, :longitude, :latitude, :artist, :language, :date, :collection_id)
    end
end
