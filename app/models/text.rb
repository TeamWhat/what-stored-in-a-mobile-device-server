class Text < ActiveRecord::Base
  extend Csvable

  belongs_to :collection
  has_one :subject, through: :collection

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |text|
        csv << text.attributes.values_at(*column_names)
      end
    end
  end

  def self.average_text_file_age
    number_of_texts = Text.all.count
    average_age = 0
    Text.all.each do |text|
      average_age = average_age + (text.date.to_time.to_i - text.date_added.to_time.to_i)
    end
    average_age = average_age/number_of_texts unless number_of_texts == 0
    # Convert seconds into hours
    average_age/86400
  end
end
