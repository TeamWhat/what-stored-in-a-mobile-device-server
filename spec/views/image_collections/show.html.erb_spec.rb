require 'rails_helper'

RSpec.describe 'image_collections/show', type: :view do
  before(:each) do
    @image_collection = assign(:image_collection, ImageCollection.create!(
      subject_id: 1
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/1/)
  end
end
