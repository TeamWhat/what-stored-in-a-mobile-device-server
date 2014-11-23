class Email < ActiveRecord::Base
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def self.to_csv(options = {})
    names = column_names - ['id', 'created_at', 'updated_at']
    CSV.generate(options) do |csv|
      csv << names
      all.each do |object|
        csv << object.attributes.values_at(*names)
      end
    end
  end
end
