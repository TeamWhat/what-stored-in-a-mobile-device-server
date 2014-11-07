json.array!(@image_collections) do |image_collection|
  json.extract! image_collection, :id, :subject_id
  json.url image_collection_url(image_collection, format: :json)
end
