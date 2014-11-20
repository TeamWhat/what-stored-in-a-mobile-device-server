json.array!(@audios) do |audio|
  json.extract! audio, :id, :time, :collection_id, :album, :artist, :composer, :year, :date_added, :date_modified, :size, :is_alarm, :is_music, :is_notification, :is_podcast, :is_ringtone, :time, :duration
  json.url audio_url(audio, format: :json)
end
