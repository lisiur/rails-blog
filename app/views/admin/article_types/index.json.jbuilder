json.array!(@admin_article_types) do |admin_article_type|
  json.extract! admin_article_type, :id, :name, :img
  json.url admin_article_type_url(admin_article_type, format: :json)
end
