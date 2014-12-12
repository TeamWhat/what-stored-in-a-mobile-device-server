require 'rails_helper'

RSpec.describe Video, type: :model do
  subject(:video) { FactoryGirl.create(:video) }
  it { is_expected.to be_valid }
  it_behaves_like 'statable'
end
