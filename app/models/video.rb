class Video < ActiveRecord::Base
  belongs_to :collection
  has_one :subject, through: :collection

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |video|
        csv << video.attributes.values_at(*column_names)
      end
    end
  end
end
