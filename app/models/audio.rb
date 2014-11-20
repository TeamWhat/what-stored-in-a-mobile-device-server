class Audio < ActiveRecord::Base
  belongs_to :collection
  has_one :subject, through: :collection
end
