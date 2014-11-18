json.array!(@collections) do |collection|
  json.extract! collection, :id, :subject_id
  json.url collection_url(collection, format: :json)
end
