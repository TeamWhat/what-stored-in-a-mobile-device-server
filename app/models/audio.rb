class Audio < ActiveRecord::Base
  extend Csvable

  belongs_to :collection
  has_one :subject, through: :collection

  def self.average_audio_file_age
    number_of_audio = Audio.all.count
    average_age = 0
    Audio.all.each do |audio|
      average_age = average_age + audio.date.to_time.to_i - audio.date_added.to_time.to_i
    end
    average_age = average_age / number_of_audio unless number_of_audio == 0
    # Convert seconds into days
    average_age / 86_400
  end

  def self.maximum_audio_file_age
    audio_ages = []
    Audio.all.each do |audio|
      audio_ages.push(audio.date.to_time.to_i - audio.date_added.to_time.to_i)
    end
    audio_ages.max / 86_400
  end

  def self.minimum_audio_file_age
    audio_ages = []
    Audio.all.each do |audio|
      audio_ages.push(audio.date.to_time.to_i - audio.date_added.to_time.to_i)
    end
    audio_ages.min / 86_400
  end

  def self.average_audio_file_size
    number_of_audios = Audio.all.count
    average_size = 0
    Audio.all.each do |audio|
      average_size += audio.size
    end
    average_size / number_of_audios unless number_of_audios == 0
  end

  def self.minimum_audio_file_size
    audio_sizes = []
    Audio.all.each do |audio|
      audio_sizes.push(audio.size)
    end
    audio_sizes.min
  end

  def self.maximum_audio_file_size
    audio_sizes = []
    Audio.all.each do |audio|
      audio_sizes.push(audio.size)
    end
    audio_sizes.max
  end
end
