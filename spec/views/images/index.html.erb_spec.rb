require 'rails_helper'

RSpec.describe 'images/index', type: :view do
  before(:each) do
    assign(:images, [
      Image.create!(
        image_collection_id: 1,
        size: 'Size',
        is_private: false,
        latitude: '',
        longitude: ''
      ),
      Image.create!(
        image_collection_id: 1,
        size: 'Size',
        is_private: false,
        latitude: '',
        longitude: ''
      )
    ])
  end

  it 'renders a list of images' do
    render
    assert_select 'tr>td', text: 1.to_s, count: 2
    assert_select 'tr>td', text: 'Size'.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: ''.to_s, count: 2
    assert_select 'tr>td', text: ''.to_s, count: 2
  end
end
