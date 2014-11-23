class Subject < ActiveRecord::Base
  has_many :collections, dependent: :destroy
  has_many :images, through: :collections
  has_many :applications, through: :collections
  has_many :texts, through: :collections

  validates_uniqueness_of :uid
  validates_presence_of :uid

  def self.find_or_create(params_for_subject, datetime, email)
    subject = Subject.find_by uid: params_for_subject[:uid]
    if subject.nil?
      subject = Subject.new(params_for_subject)
      subject.date = DateTime.strptime(datetime, '%s') unless datetime.nil?
      subject.save
      Email.create(email: email)
    end
    subject.version = params_for_subject[:version]
    subject
  end

  def self.to_csv(options = {})
    names = column_names - ['uid', 'id', 'created_at', 'updated_at']
    CSV.generate(options) do |csv|
      csv << names
      all.each do |object|
        csv << object.attributes.values_at(*names)
      end
    end
  end
end
