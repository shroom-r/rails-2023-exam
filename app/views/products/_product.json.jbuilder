json.extract! product, :id, :title, :price, :discounted, :category, :created_at, :updated_at
json.url product_url(product, format: :json)
