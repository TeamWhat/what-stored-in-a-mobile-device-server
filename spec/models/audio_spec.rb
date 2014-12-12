require 'rails_helper'

RSpec.describe Audio, type: :model do
  subject(:audio) { FactoryGirl.create(:audio) }
  it { is_expected.to be_valid }
  it_behaves_like 'statable'
end
