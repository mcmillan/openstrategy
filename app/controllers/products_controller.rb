class ProductsController < ApplicationController
  before_action :load_product

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
