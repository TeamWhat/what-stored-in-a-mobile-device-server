class Collection < ActiveRecord::Base
  belongs_to :subject
  has_many :images, dependent: :destroy
  has_many :applications, dependent: :destroy
end
