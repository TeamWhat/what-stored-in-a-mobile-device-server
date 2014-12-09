class Subject < ActiveRecord::Base
  extend Csvable

  has_many :collections, dependent: :destroy
  has_many :images, through: :collections
  has_many :applications, through: :collections
  has_many :texts, through: :collections
  has_many :audios, through: :collections
  has_many :videos, through: :collections

  validates_uniqueness_of :uid
  validates_presence_of :uid

  # Finds or creates the subject
  def self.find_or_create(params_for_subject, datetime)
    # Find subject by uid
    subject = Subject.find_by uid: params_for_subject[:uid]
    if subject.nil?
      subject = Subject.new(params_for_subject)
      subject.date = DateTime.strptime(datetime, '%s') unless datetime.nil?
    end
    # Update the fields that can change
    subject.version = params_for_subject[:version]
    subject.gender = params_for_subject[:gender]
    subject.age = params_for_subject[:age]
    subject.country = params_for_subject[:country]
    subject.total_external_space = params_for_subject[:total_external_space]
    subject.free_external_space = params_for_subject[:free_external_space]
    subject.total_internal_space = params_for_subject[:total_internal_space]
    subject.free_internal_space = params_for_subject[:free_internal_space]
    subject.save
    subject
  end
end
