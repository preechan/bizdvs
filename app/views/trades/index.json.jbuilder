json.array!(@trades) do |trade|
  json.extract! trade, :id, :name
  json.url trade_url(trade, format: :json)
end
