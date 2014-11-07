require 'rails_helper'

RSpec.describe 'image_collections/new', type: :view do
  before(:each) do
    assign(:image_collection, ImageCollection.new(
      subject_id: 1
    ))
  end

  it 'renders new image_collection form' do
    render

    assert_select 'form[action=?][method=?]', image_collections_path, 'post' do

      assert_select 'input#image_collection_subject_id[name=?]', 'image_collection[subject_id]'
    end
  end
end
