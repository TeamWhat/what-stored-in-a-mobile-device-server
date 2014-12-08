class VideosController < ApplicationController
  respond_to :html, except: :index
  before_action :set_video, only: [:show, :destroy]

  def index
    @videos = Video.all
    @video_count = Video.all.count
    respond_to do |format|
      format.html
      format.csv { send_data @videos.to_csv }
      format.xls
    end
  end

  def show
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
end
