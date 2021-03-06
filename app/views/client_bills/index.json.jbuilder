json.array!(@bills) do |bill|
  json.extract! bill, :id, :title, :description, :amount, :paid, :emission_date, :due_date
  json.url bill_url(bill, format: :json)
end
