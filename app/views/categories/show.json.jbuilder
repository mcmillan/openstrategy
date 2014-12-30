json.extract!(@category, :id, :title)
json.products(@category.products) do |p|
  json.extract!(p, :title, :description, :url)
end
