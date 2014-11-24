class Application < ActiveRecord::Base
  extend Csvable

  belongs_to :collection
  has_one :subject, through: :collection
end
