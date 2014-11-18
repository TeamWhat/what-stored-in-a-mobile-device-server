json.array!(@applications) do |application|
  json.extract! application, :id, :label, :package_name, :first_installed, :version_name, :target_sdk_version
  json.url application_url(application, format: :json)
end
