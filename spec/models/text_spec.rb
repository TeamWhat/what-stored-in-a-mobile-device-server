require 'rails_helper'

RSpec.describe Text, type: :model do
  subject(:text) { FactoryGirl.create(:text) }
  it { is_expected.to be_valid }
end
