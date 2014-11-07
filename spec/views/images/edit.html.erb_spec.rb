require 'rails_helper'

RSpec.describe 'images/edit', type: :view do
  before(:each) do
    @image = assign(:image, Image.create!(
      image_collection_id: 1,
      size: 'MyString',
      is_private: false,
      latitude: '',
      longitude: ''
    ))
  end

  it 'renders the edit image form' do
    render

    assert_select 'form[action=?][method=?]', image_path(@image), 'post' do

      assert_select 'input#image_image_collection_id[name=?]', 'image[image_collection_id]'

      assert_select 'input#image_size[name=?]', 'image[size]'

      assert_select 'input#image_is_private[name=?]', 'image[is_private]'

      assert_select 'input#image_latitude[name=?]', 'image[latitude]'

      assert_select 'input#image_longitude[name=?]', 'image[longitude]'
    end
  end
end
