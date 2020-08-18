json.extract! siteowner, :id, :created_at, :updated_at, :sum, :spent, :incoming
json.url siteowner_url(siteowner, format: :json)
