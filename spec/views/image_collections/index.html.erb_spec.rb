require 'rails_helper'

RSpec.describe 'image_collections/index', type: :view do
  before(:each) do
    assign(:image_collections, [
      ImageCollection.create!(
        subject_id: 1
      ),
      ImageCollection.create!(
        subject_id: 1
      )
    ])
  end

  it 'renders a list of image_collections' do
    render
    assert_select 'tr>td', text: 1.to_s, count: 2
  end
end
