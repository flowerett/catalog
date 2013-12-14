json.array!(@products) do |product|
  json.extract! product, :id, :title, :description, :rating, :price, :inet_price, :image
  json.url product_url(product, format: :json)
end
