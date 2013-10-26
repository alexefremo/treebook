json.array!(@statuses) do |status|
  json.extract! status, :user_id, :name, :content
  json.url status_url(status, format: :json)
end
