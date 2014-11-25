require 'rails_helper'

RSpec.describe "videos/show", :type => :view do
  before(:each) do
    @video = assign(:video, Video.create!(
      :tags => "Tags",
      :album => "Album",
      :resolution => "Resolution",
      :size => "Size",
      :category => "Category",
      :duration => 1,
      :description => "Description",
      :is_private => "Is Private",
      :longitude => 1.5,
      :latitude => 1.5,
      :artist => "Artist",
      :language => "Language",
      :collection_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Tags/)
    expect(rendered).to match(/Album/)
    expect(rendered).to match(/Resolution/)
    expect(rendered).to match(/Size/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Is Private/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Artist/)
    expect(rendered).to match(/Language/)
    expect(rendered).to match(/2/)
  end
end
