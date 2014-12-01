class Text < ActiveRecord::Base
  extend Csvable
  extend Statable

  belongs_to :collection
  has_one :subject, through: :collection

  def self.average_text_file_age
    number_of_texts = Text.all.count
    average_age = 0
    Text.all.each do |text|
      average_age = average_age + (text.date.to_time.to_i - text.date_added.to_time.to_i)
    end
    average_age = average_age / number_of_texts unless number_of_texts == 0
    # Convert seconds into days
    average_age / 86_400 unless average_age.zero?
  end

  def self.maximum_text_file_age
    text_ages = []
    Text.all.each do |text|
      text_ages.push(text.date.to_time.to_i - text.date_added.to_time.to_i)
    end
    text_ages.max / 86_400 unless text_ages.empty?
  end

  def self.minimum_text_file_age
    text_ages = []
    Text.all.each do |text|
      text_ages.push(text.date.to_time.to_i - text.date_added.to_time.to_i)
    end
    text_ages.min / 86_400 unless text_ages.empty?
  end

  def self.average_text_file_size
    number_of_texts = Text.all.count
    average_size = 0
    Text.all.each do |text|
      average_size += text.size

    end
    average_size / number_of_texts / 1000 unless number_of_texts == 0
  end

  def self.minimum_text_file_size
    text_sizes = []
    Text.all.each do |text|
      text_sizes.push(text.size)
    end
    text_sizes.min / 1000 unless text_sizes.empty?
  end

  def self.maximum_text_file_size
    text_sizes = []
    Text.all.each do |text|
      text_sizes.push(text.size)
    end
    text_sizes.max / 1000 unless text_sizes.empty?
  end
end
