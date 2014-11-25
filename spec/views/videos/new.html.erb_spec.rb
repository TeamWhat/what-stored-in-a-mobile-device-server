require 'rails_helper'

RSpec.describe 'videos/new', type: :view do
  before(:each) do
    assign(:video, Video.new(
      tags: 'MyString',
      album: 'MyString',
      resolution: 'MyString',
      size: 'MyString',
      category: 'MyString',
      duration: 1,
      description: 'MyString',
      is_private: 'MyString',
      longitude: 1.5,
      latitude: 1.5,
      artist: 'MyString',
      language: 'MyString',
      collection_id: 1
    ))
  end

  it 'renders new video form' do
    render

    assert_select 'form[action=?][method=?]', videos_path, 'post' do

      assert_select 'input#video_tags[name=?]', 'video[tags]'

      assert_select 'input#video_album[name=?]', 'video[album]'

      assert_select 'input#video_resolution[name=?]', 'video[resolution]'

      assert_select 'input#video_size[name=?]', 'video[size]'

      assert_select 'input#video_category[name=?]', 'video[category]'

      assert_select 'input#video_duration[name=?]', 'video[duration]'

      assert_select 'input#video_description[name=?]', 'video[description]'

      assert_select 'input#video_is_private[name=?]', 'video[is_private]'

      assert_select 'input#video_longitude[name=?]', 'video[longitude]'

      assert_select 'input#video_latitude[name=?]', 'video[latitude]'

      assert_select 'input#video_artist[name=?]', 'video[artist]'

      assert_select 'input#video_language[name=?]', 'video[language]'

      assert_select 'input#video_collection_id[name=?]', 'video[collection_id]'
    end
  end
end
