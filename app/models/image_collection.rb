class ImageCollection < ActiveRecord::Base
  belongs_to :subject
  has_many :images, dependent: :destroy
end
