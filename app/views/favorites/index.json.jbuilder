json.array!(@favorites) do |f|
  json.extract!(f, :id, :title, :description, :color)
  json.url go_product_url(f)
end
