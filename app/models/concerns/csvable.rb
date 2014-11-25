module Csvable
  extend ActiveSupport::Concern

  def to_csv(options = {})
  	names = column_names - ['updated_at', 'uid']
    CSV.generate(options) do |csv|
      csv << names
      all.each do |object|
        csv << object.attributes.values_at(*names)
      end
    end
  end
end