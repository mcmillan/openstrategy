module CategoriesHelper
  def background(title)
    GeoPattern.generate(title).uri_image
  end
end
