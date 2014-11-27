class Image < ActiveRecord::Base
  extend Csvable

  belongs_to :collection
  has_one :subject, through: :collection

  def self.average_image_file_age
    number_of_images = Image.all.count
    average_age = 0
    Image.all.each do |image|
      average_age = average_age + image.date.to_time.to_i - image.date_added.to_time.to_i
    end
    average_age = average_age / number_of_images unless number_of_images == 0
    # Convert seconds into days
    average_age / 86_400 unless average_age.zero?
  end

  def self.minimum_image_file_age
    image_ages = []
    Image.all.each do |image|
      image_ages.push(image.date.to_time.to_i - image.date_added.to_time.to_i)
    end
    image_ages.min / 86_400 unless image_ages.empty?
  end

  def self.maximum_image_file_age
    image_ages = []
    Image.all.each do |image|
      image_ages.push(image.date.to_time.to_i - image.date_added.to_time.to_i)
    end
    image_ages.max / 86_400 unless image_ages.empty?
  end

  def self.average_image_file_size
    number_of_images = Image.all.count
    average_size = 0
    Image.all.each do |image|
      average_size += image.size
    end
    average_size / number_of_images / 1000 unless number_of_images == 0
  end

  def self.minimum_image_file_size
    image_sizes = []
    Image.all.each do |image|
      image_sizes.push(image.size)
    end
    image_sizes.min / 1000 unless image_sizes.empty?
  end

  def self.maximum_image_file_size
    image_sizes = []
    Image.all.each do |image|
      image_sizes.push(image.size)
    end
    image_sizes.max / 1000 unless image_sizes.empty?
  end
end
