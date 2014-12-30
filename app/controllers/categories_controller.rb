class CategoriesController < ApplicationController
  before_action :add_wide_open_cors_headers, if: -> { request.format.json? }

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end
end
