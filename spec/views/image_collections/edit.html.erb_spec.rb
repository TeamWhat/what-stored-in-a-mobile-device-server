require 'rails_helper'

RSpec.describe 'image_collections/edit', type: :view do
  before(:each) do
    @image_collection = assign(:image_collection, ImageCollection.create!(
      subject_id: 1
    ))
  end

  it 'renders the edit image_collection form' do
    render

    assert_select 'form[action=?][method=?]', image_collection_path(@image_collection), 'post' do

      assert_select 'input#image_collection_subject_id[name=?]', 'image_collection[subject_id]'
    end
  end
end
