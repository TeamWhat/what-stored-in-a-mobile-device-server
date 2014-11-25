require 'rails_helper'

RSpec.describe "videos/index", :type => :view do
  before(:each) do
    assign(:videos, [
      Video.create!(
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
      ),
      Video.create!(
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
      )
    ])
  end

  it "renders a list of videos" do
    render
    assert_select "tr>td", :text => "Tags".to_s, :count => 2
    assert_select "tr>td", :text => "Album".to_s, :count => 2
    assert_select "tr>td", :text => "Resolution".to_s, :count => 2
    assert_select "tr>td", :text => "Size".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Is Private".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Artist".to_s, :count => 2
    assert_select "tr>td", :text => "Language".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
