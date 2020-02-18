json.extract! restaurant, :id, :name, :country, :state, :city, :zip_code, :address, :phone_number, :website, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
