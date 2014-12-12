require 'rails_helper'

RSpec.describe Image, type: :model do
  subject(:image) { FactoryGirl.create(:image) }
  it { is_expected.to be_valid }
  it_behaves_like 'statable'
end
