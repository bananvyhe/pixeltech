json.extract! post, :id, :title, :body, :clan_name, :created_at, :updated_at
json.url post_url(post, format: :json)
