json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :client_id, :bill_id, :title, :description, :state
  json.url ticket_url(ticket, format: :json)
end
