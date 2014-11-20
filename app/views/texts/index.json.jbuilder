json.array!(@texts) do |text|
  json.extract! text, :id, :date, :size, :date_modified, :date_added, :mime_type
  json.url text_url(text, format: :json)
end
