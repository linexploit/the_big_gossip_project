json.extract! user, :id, :username, :email, :age, :bio, :city_id, :created_at, :updated_at
json.url user_url(user, format: :json)
