require 'rails_helper'

RSpec.describe Subject, type: :model do
  subject(:subject) { FactoryGirl.create(:subject) }
  it { is_expected.to be_valid }
end
