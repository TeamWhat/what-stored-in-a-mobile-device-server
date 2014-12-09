class AudiosController < ApplicationController
  respond_to :html, except: :index
  before_action :set_audio, only: [:show, :destroy]

  def index
    @audios = Audio.all
    @audio_count = Audio.all.count
    respond_to do |format|
      format.html
      format.csv { send_data @audios.to_csv }
      format.xls
    end
  end

  def show
    respond_with(@audio)
  end

  def destroy
    @audio.destroy
    respond_with(@audio)
  end

  private

  def set_audio
    @audio = Audio.find(params[:id])
  end
end
