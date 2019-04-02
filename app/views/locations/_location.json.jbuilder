json.extract! location, :id, :location_type, :address, :address2, :city, :postal_code, :country, :reception_phone, :created_at, :updated_at
json.url location_url(location, format: :json)
