class ProductsController < ApplicationController
  def image
    @product = Product.find(params[:id])

    render text: GeoPattern.generate(@product.id.to_s).svg_string, content_type: 'image/svg+xml'
  end
end
