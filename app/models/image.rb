class Image < ActiveRecord::Base
  belongs_to :collection
  has_one :subject, through: :collection

  def self.to_csv(options = {})
    names = column_names - ['collection_id', 'id', 'created_at', 'updated_at']
    CSV.generate(options) do |csv|
      csv << names
      all.each do |object|
        csv << object.attributes.values_at(*names)
      end
    end
  end
end
