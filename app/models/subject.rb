class Subject < ActiveRecord::Base
  has_many :image_collections, dependent: :destroy
  has_many :images, through: :image_collections

  validates_uniqueness_of :uid
  validates_presence_of :uid
end
