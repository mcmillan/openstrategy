json.extract!(@category, :id, :title)
json.products(@category.products) do |p|
  json.extract!(p, :title, :description)
  json.url go_product_url(p)
  json.image_url image_product_url(p)
  json.color p.color
end
