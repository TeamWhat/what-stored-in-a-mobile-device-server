class Image < ActiveRecord::Base
  belongs_to :image_collection
  has_one :subject, through: :image_collection

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |image|
        csv << image.attributes.values_at(*column_names)
      end
    end
  end
end
