json.array!(@admin_archives) do |admin_archive|
  json.extract! admin_archive, :id
  json.url admin_archive_url(admin_archive, format: :json)
end
