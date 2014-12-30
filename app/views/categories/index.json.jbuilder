json.array! @categories do |c|
  json.extract!(c, :id, :title)
  json.url category_url(c, format: :json)
end
