json.extract!(@category, :id, :title)
json.products(@category.products) do |p|
  json.extract!(p, :title, :description, :url)
  json.image_url image_product_url(p)
end
