json.extract! inbox, :id, :body, :operation_id, :created_at, :updated_at
json.url inbox_url(inbox, format: :json)
