json.array!(@contacts) do |contact|
  json.extract! contact, :id, :client_id, :name, :phone, :email, :view_at, :note, :region, :department, :postal_code, :address
  json.url contact_url(contact, format: :json)
end
