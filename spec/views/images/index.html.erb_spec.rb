require 'rails_helper'

RSpec.describe 'images/index', type: :view do
  before(:each) do
    assign(:images, [
      Image.create!(
        image_collection_id: 1,
        size: 'Size',
        is_private: false,
        latitude: '60.2',
        longitude: '24.5'
      ),
      Image.create!(
        image_collection_id: 1,
        size: 'Size',
        is_private: false,
        latitude: '60.2',
        longitude: '24.5'
      )
    ])
  end

  it 'renders a list of images' do
    render
    assert_select 'tr>td', text: 'Size'.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: '60.2'.to_s, count: 2
    assert_select 'tr>td', text: '24.5'.to_s, count: 2
  end
end
