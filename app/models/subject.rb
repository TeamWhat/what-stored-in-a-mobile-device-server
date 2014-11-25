class Subject < ActiveRecord::Base
  extend Csvable

  has_many :collections, dependent: :destroy
  has_many :images, through: :collections
  has_many :applications, through: :collections
  has_many :texts, through: :collections

  validates_uniqueness_of :uid
  validates_presence_of :uid

  def self.find_or_create(params_for_subject, datetime)
    subject = Subject.find_by uid: params_for_subject[:uid]
    if subject.nil?
      subject = Subject.new(params_for_subject)
      subject.date = DateTime.strptime(datetime, '%s') unless datetime.nil?
    end
    subject.version = params_for_subject[:version]
    subject.gender = params_for_subject[:gender]
    subject.age = params_for_subject[:age]
    subject.country = params_for_subject[:country]
    subject.save
    subject
  end
end
