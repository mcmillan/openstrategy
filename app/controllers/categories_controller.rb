class CategoriesController < ApplicationController
  after_action :add_wide_open_cors_headers, if: -> { request.format.json? }

  def index
    @categories = Category.non_library
  end

  def show
    @category = Category.find(params[:id])
  end
end
