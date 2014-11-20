require 'rails_helper'

RSpec.describe 'audios/edit', type: :view do
  before(:each) do
    @audio = assign(:audio, Audio.create!(
      collection_id: 1,
      album: 'MyString',
      artist: 'MyString',
      composer: 'MyString',
      year: 1,
      size: 1,
      is_alarm: 'MyString',
      is_music: 'MyString',
      is_notification: 'MyString',
      is_podcast: 'MyString',
      is_ringtone: 'MyString',
      duration: 1
    ))
  end

  it 'renders the edit audio form' do
    render

    assert_select 'form[action=?][method=?]', audio_path(@audio), 'post' do

      assert_select 'input#audio_collection_id[name=?]', 'audio[collection_id]'

      assert_select 'input#audio_album[name=?]', 'audio[album]'

      assert_select 'input#audio_artist[name=?]', 'audio[artist]'

      assert_select 'input#audio_composer[name=?]', 'audio[composer]'

      assert_select 'input#audio_year[name=?]', 'audio[year]'

      assert_select 'input#audio_size[name=?]', 'audio[size]'

      assert_select 'input#audio_is_alarm[name=?]', 'audio[is_alarm]'

      assert_select 'input#audio_is_music[name=?]', 'audio[is_music]'

      assert_select 'input#audio_is_notification[name=?]', 'audio[is_notification]'

      assert_select 'input#audio_is_podcast[name=?]', 'audio[is_podcast]'

      assert_select 'input#audio_is_ringtone[name=?]', 'audio[is_ringtone]'

      assert_select 'input#audio_duration[name=?]', 'audio[duration]'
    end
  end
end
