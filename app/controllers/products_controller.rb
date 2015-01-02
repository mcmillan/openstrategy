class ProductsController < ApplicationController
  before_action :load_product
  caches_page :image

  def image
    render text: GeoPattern.generate(@product.id.to_s).svg_string, content_type: 'image/svg+xml'
  end

  def go
    @product.product_clicks.create(
      ip_address: request.remote_ip,
      user_agent: request.user_agent
    )
    redirect_to @product.url
  end

  private

  def load_product
    @product = Product.find(params[:id])
  end
end
