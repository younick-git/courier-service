json.extract! user, :id, :full_name, :address, :mobile_number, :pin_code, :created_at, :updated_at
json.url user_url(user, format: :json)
