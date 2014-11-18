json.array!(@images) do |image|
  json.extract! image, :id, :collection_id, :date, :size, :date_modified, :date_added, :date_taken, :is_private, :latitude, :longitude
  json.url image_url(image, format: :json)
end
