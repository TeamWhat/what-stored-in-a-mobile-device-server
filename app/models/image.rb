class Image < ActiveRecord::Base
  belongs_to :image_collection
  belongs_to :subject, through: :image_collection
end
