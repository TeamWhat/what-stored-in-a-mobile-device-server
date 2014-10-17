json.array!(@demos) do |demo|
  json.extract! demo, :id, :message
  json.url demo_url(demo, format: :json)
end
