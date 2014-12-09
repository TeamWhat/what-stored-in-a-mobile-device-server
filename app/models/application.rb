class Application < ActiveRecord::Base
  extend Csvable

  belongs_to :collection
  has_one :subject, through: :collection

  # Calculates average age since install in days
  def self.average_application_install_age
    number_of_applications = Application.all.count
    average_age = 0
    Application.all.each do |application|
      average_age = average_age + application.date.to_time.to_i - application.first_installed.to_time.to_i
    end
    average_age = average_age / number_of_applications unless number_of_applications == 0
    # Convert seconds into days
    average_age / 86_400
  end

  # Calculates maximum age since install in days
  def self.maximum_application_install_age
    application_ages = []
    Application.all.each do |application|
      application_ages.push(application.date.to_time.to_i - application.first_installed.to_time.to_i)
    end
    # Convert seconds into days
    application_ages.max / 86_400 unless application_ages.empty?
  end

  # Calculates minimum age since install in days
  def self.minimum_application_file_age
    application_ages = []
    Application.all.each do |application|
      application_ages.push(application.date.to_time.to_i - application.first_installed.to_time.to_i)
    end
    # Convert seconds into days
    application_ages.min / 86_400 unless application_ages.empty?
  end
end
