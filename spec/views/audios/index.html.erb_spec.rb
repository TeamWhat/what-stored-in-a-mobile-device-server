require 'rails_helper'

RSpec.describe 'audios/index', type: :view do
  before(:each) do
    assign(:audios, [
      Audio.create!(
        collection_id: 1,
        album: 'Album',
        artist: 'Artist',
        composer: 'Composer',
        year: 2,
        size: 3,
        is_alarm: 'Is Alarm',
        is_music: 'Is Music',
        is_notification: 'Is Notification',
        is_podcast: 'Is Podcast',
        is_ringtone: 'Is Ringtone',
        duration: 4
      ),
      Audio.create!(
        collection_id: 1,
        album: 'Album',
        artist: 'Artist',
        composer: 'Composer',
        year: 2,
        size: 3,
        is_alarm: 'Is Alarm',
        is_music: 'Is Music',
        is_notification: 'Is Notification',
        is_podcast: 'Is Podcast',
        is_ringtone: 'Is Ringtone',
        duration: 4
      )
    ])
  end

  it 'renders a list of audios' do
    render
    assert_select 'tr>td', text: 1.to_s, count: 2
    assert_select 'tr>td', text: 'Album'.to_s, count: 2
    assert_select 'tr>td', text: 'Artist'.to_s, count: 2
    assert_select 'tr>td', text: 'Composer'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 3.to_s, count: 2
    assert_select 'tr>td', text: 'Is Alarm'.to_s, count: 2
    assert_select 'tr>td', text: 'Is Music'.to_s, count: 2
    assert_select 'tr>td', text: 'Is Notification'.to_s, count: 2
    assert_select 'tr>td', text: 'Is Podcast'.to_s, count: 2
    assert_select 'tr>td', text: 'Is Ringtone'.to_s, count: 2
    assert_select 'tr>td', text: 4.to_s, count: 2
  end
end
