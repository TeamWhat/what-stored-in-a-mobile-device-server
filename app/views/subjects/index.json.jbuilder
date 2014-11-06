json.array!(@subjects) do |subject|
  json.extract! subject, :id, :date, :brand, :model, :device, :product, :serial, :uid
  json.url subject_url(subject, format: :json)
end
