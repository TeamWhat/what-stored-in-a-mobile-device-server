class AudiosController < ApplicationController
  before_action :set_audio, only: [:show, :edit, :update, :destroy]

  def index
    @audios = Audio.all
    respond_with(@audios)
  end

  def show
    respond_with(@audio)
  end

  def new
    @audio = Audio.new
    respond_with(@audio)
  end

  def edit
  end

  def create
    @audio = Audio.new(audio_params)
    @audio.save
    respond_with(@audio)
  end

  def update
    @audio.update(audio_params)
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

  def audio_params
    params.require(:audio).permit(:time, :collection_id, :album, :artist, :composer, :year, :date_added, :date_modified, :size, :is_alarm, :is_music, :is_notification, :is_podcast, :is_ringtone, :duration)
  end
end
