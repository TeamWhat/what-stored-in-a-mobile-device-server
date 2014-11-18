require 'rails_helper'

RSpec.describe Collection, type: :model do
  subject(:collection) { FactoryGirl.create(:collection) }
  it { is_expected.to be_valid }
end
