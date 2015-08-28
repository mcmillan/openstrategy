json.extract!(@category, :id, :title)
json.products(@category.products) do |p|
  json.extract!(p, :id, :title, :description, :promoted)
  json.logo_url asset_url(p.logo.url)
  json.url go_product_url(p)
  json.favorited user_signed_in? && p.favorited_by?(current_user)
end
