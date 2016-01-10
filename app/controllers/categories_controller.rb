class CategoriesController < ApplicationController
  before_action :load_categories

  def index
  end

  def show
    @category = Category.friendly.find(params[:id])

    if user_signed_in?
      @products = Product.ordered_by_favorites(@category, current_user)
    else
      @products = @category.products
    end
  end

  private

  def load_categories
    @categories = Category.all
  end
end
