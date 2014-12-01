json.array!(@contractors) do |contractor|
  json.extract! contractor, :id, :name, :licenseNo, :licenseClass, :bondingcapacity, :firstname, :lastname, :address, :city, :state, :zipcode, :phone, :email, :trade, :comments
  json.url contractor_url(contractor, format: :json)
end
