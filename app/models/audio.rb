class Audio < ActiveRecord::Base
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
end
