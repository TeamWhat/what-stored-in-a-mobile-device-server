class Image < ActiveRecord::Base
  belongs_to :image_collection
  has_one :subject, through: :image_collection
end
