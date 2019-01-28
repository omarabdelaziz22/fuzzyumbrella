json.extract! favoritelist, :id, :name, :user_id, :created_at, :updated_at
json.url favoritelist_url(favoritelist, format: :json)
