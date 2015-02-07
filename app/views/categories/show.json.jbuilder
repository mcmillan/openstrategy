json.extract!(@category, :id, :title)
json.products(@category.products) do |p|
  json.extract!(p, :id, :title, :description, :color)
  json.url go_product_url(p)
  json.favorited user_signed_in? && p.favorited_by?(current_user)
end
