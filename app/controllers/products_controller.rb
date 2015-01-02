class ProductsController < ApplicationController
  before_action :load_product

  def image
    render text: GeoPattern.generate(@product.id.to_s).svg_string, content_type: 'image/svg+xml'
  end

  def go
    redirect_to @product.url
  end

  private

  def load_product
    @product = Product.find(params[:id])
  end
end
