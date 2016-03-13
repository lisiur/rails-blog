json.array!(@index_users) do |index_user|
  json.extract! index_user, :id
  json.url index_user_url(index_user, format: :json)
end
