class Subject < ActiveRecord::Base
  has_many :image_collections, dependent: :destroy
  has_many :images, through: :image_collections

  validates_uniqueness_of :uid
  validates_presence_of :uid

  def self.find_or_create(params_for_subject)
    subject = Subject.find_by uid: params_for_subject[:uid]
    subject = Subject.create(params_for_subject) if subject.nil?
    subject
  end
end
