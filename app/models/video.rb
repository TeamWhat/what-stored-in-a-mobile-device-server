class Video < ActiveRecord::Base
  extend Csvable
  extend Statable

  belongs_to :collection
  has_one :subject, through: :collection
end
