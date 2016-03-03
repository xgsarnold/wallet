json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :description, :recipient, :activity, :amount, :balance
  json.url transaction_url(transaction, format: :json)
end
