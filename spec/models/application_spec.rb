require 'rails_helper'

RSpec.describe Application, type: :model do
  subject(:application) { FactoryGirl.create(:application) }
  it { is_expected.to be_valid }
end
