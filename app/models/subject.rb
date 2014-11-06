class Subject < ActiveRecord::Base
  validates_uniqueness_of :uid
  validates_presence_of :uid
end
