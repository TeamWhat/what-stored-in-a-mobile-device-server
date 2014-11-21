class Image < ActiveRecord::Base
  extend Csvable
  
  belongs_to :collection
  has_one :subject, through: :collection

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |image|
        csv << image.attributes.values_at(*column_names)
      end
    end
  end

  def self.average_image_file_age
    number_of_images = Image.all.count
    average_age = 0
    Image.all.each do |image|
      average_age = average_age + image.date.to_time.to_i - image.date_taken.to_time.to_i
    end
    average_age = average_age/number_of_images unless number_of_images == 0
    # Convert seconds into hours
    average_age/86400
  end
end
