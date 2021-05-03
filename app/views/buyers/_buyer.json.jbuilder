json.extract! buyer, :firstname, :lastname, :email, :created_at, :updated_at
json.url buyer_url(buyer, format: :json)
