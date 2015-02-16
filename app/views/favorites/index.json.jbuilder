json.array!(@favorites) do |f|
  json.extract!(f, :id, :title, :description)
  json.url go_product_url(f)
end
