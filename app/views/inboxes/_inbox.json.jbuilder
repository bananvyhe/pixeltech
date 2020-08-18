json.extract! inbox, :id, :body, :operation_id, :amount, :label, :sha1_hash, :unaccepted, :created_at, :updated_at
json.url inbox_url(inbox, format: :json)
