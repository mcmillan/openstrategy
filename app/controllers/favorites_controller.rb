class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_product

  def create
    @product.users << current_user
    head :no_content
  end

  def destroy
    @product.users.delete(current_user)
    head :no_content
  end

  private

  def load_product
    @product = Product.find(params[:product_id])
  end
end
