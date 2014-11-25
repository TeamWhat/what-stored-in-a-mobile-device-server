class Video < ActiveRecord::Base
  extend Csvable

  belongs_to :collection
  has_one :subject, through: :collection

  def self.average_video_file_age
    number_of_videos = Video.all.count
    average_age = 0
    Video.all.each do |video|
      average_age = average_age + video.date.to_time.to_i - video.date_added.to_time.to_i
    end
    average_age = average_age / number_of_videos unless number_of_videos == 0
    # Convert seconds into days
    average_age / 86_400
  end

  def self.minimum_video_file_age
    return -1 if Video.all.empty?
    video_ages = []
    Video.all.each do |video|
      video_ages.push(video.date.to_time.to_i - video.date_added.to_time.to_i)
    end
    video_ages.min / 86_400
  end

  def self.maximum_video_file_age
    return -1 if Video.all.empty?
    video_ages = []
    Video.all.each do |video|
      video_ages.push(video.date.to_time.to_i - video.date_added.to_time.to_i)
    end
    video_ages.max / 86_400
  end

  def self.average_video_file_size
    number_of_videos = Video.all.count
    average_size = 0
    Video.all.each do |video|
      average_size += video.size
    end
    average_size / number_of_videos unless number_of_videos == 0
  end

  def self.minimum_video_file_size
    video_sizes = []
    Video.all.each do |video|
      video_sizes.push(video.size)
    end
    video_sizes.min
  end

  def self.maximum_video_file_size
    video_sizes = []
    Video.all.each do |video|
      video_sizes.push(video.size)
    end
    video_sizes.max
  end
end
