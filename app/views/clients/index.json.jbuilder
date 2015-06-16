json.array!(@clients) do |client|
  json.extract! client, :id, :name, :url, :activity, :contact_reasons, :contact_id
  json.url client_url(client, format: :json)
end
