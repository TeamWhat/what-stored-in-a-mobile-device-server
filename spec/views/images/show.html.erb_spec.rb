require 'rails_helper'

RSpec.describe 'images/show', type: :view do
  before(:each) do
    @image = assign(:image, Image.create!(
      image_collection_id: 1,
      size: 'Size',
      is_private: false,
      latitude: '',
      longitude: ''
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Size/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
