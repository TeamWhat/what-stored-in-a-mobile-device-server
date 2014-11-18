require 'rails_helper'

RSpec.describe 'collections/index', type: :view do
  before(:each) do
    assign(:collections, [
      Collection.create!(
        subject_id: 1
      ),
      Collection.create!(
        subject_id: 1
      )
    ])
  end

  it 'renders a list of collections' do
    render
    assert_select 'tr>td', text: 1.to_s, count: 2
  end
end
