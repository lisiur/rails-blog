json.array!(@manage_article_types) do |manage_article_type|
  json.extract! manage_article_type, :id, :name, :img
  json.url manage_article_type_url(manage_article_type, format: :json)
end
