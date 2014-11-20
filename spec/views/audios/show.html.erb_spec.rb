require 'rails_helper'

RSpec.describe 'audios/show', type: :view do
  before(:each) do
    @audio = assign(:audio, Audio.create!(
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
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Album/)
    expect(rendered).to match(/Artist/)
    expect(rendered).to match(/Composer/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Is Alarm/)
    expect(rendered).to match(/Is Music/)
    expect(rendered).to match(/Is Notification/)
    expect(rendered).to match(/Is Podcast/)
    expect(rendered).to match(/Is Ringtone/)
    expect(rendered).to match(/4/)
  end
end
