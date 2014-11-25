json.array!(@videos) do |video|
  json.extract! video, :id, :tags, :album, :resolution, :size, :category, :duration, :date_added, :date_modified, :date_taken, :description, :is_private, :longitude, :latitude, :artist, :language, :date, :collection_id
  json.url video_url(video, format: :json)
end
