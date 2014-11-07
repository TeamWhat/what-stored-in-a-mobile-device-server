require 'rails_helper'

RSpec.describe ImageCollection, type: :model do
  subject(:image_collection) { FactoryGirl.create(:image_collection) }
  it { is_expected.to be_valid }
end
