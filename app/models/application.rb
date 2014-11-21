class Application < ActiveRecord::Base
  extend Csvable

  belongs_to :collection
  has_one :subject, through: :collection

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |application|
        csv << application.attributes.values_at(*column_names)
      end
    end
  end

  def self.average_application_install_age
    number_of_applications = Application.all.count
    average_age = 0
    Application.all.each do |application|
      average_age = average_age + application.date.to_time.to_i - application.first_installed.to_time.to_i
    end
    average_age = average_age/number_of_applications unless number_of_applications == 0
    # Convert seconds into days
    average_age/86400
  end

  def self.maximum_application_install_age
    application_ages = Array.new
    Application.all.each do |application|
      application_ages.push(application.date.to_time.to_i - application.first_installed.to_time.to_i)
    end
    application_ages.max/86400
  end

  def self.minimum_application_file_age
    application_ages = Array.new
    Application.all.each do |application|
      application_ages.push(application.date.to_time.to_i - application.first_installed.to_time.to_i)
    end
    application_ages.min/86400
  end
end
