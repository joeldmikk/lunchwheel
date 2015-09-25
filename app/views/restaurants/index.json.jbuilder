json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :price, :distance
  json.url restaurant_url(restaurant, format: :json)
end
