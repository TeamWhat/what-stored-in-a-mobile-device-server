require 'rails_helper'

RSpec.describe 'images/new', type: :view do
  before(:each) do
    assign(:image, Image.new(
      image_collection_id: 1,
      size: 'MyString',
      is_private: false,
      latitude: '',
      longitude: ''
    ))
  end

  it 'renders new image form' do
    render

    assert_select 'form[action=?][method=?]', images_path, 'post' do

      assert_select 'input#image_image_collection_id[name=?]', 'image[image_collection_id]'

      assert_select 'input#image_size[name=?]', 'image[size]'

      assert_select 'input#image_is_private[name=?]', 'image[is_private]'

      assert_select 'input#image_latitude[name=?]', 'image[latitude]'

      assert_select 'input#image_longitude[name=?]', 'image[longitude]'
    end
  end
end
