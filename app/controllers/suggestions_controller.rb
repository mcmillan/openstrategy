class SuggestionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create], if: -> { request.format.json? }
  after_action :add_wide_open_cors_headers, only: [:create], if: -> { request.format.json? }

  def new
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)

    respond_to do |format|
      if @suggestion.save
        format.html { redirect_to root_path }
        format.json { head :no_content }
      else
        format.html { render 'new' }
        format.json { render json: { errors: @suggestion.errors.full_messages } }
      end
    end
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(
      :category_id,
      :title,
      :description,
      :url,
      :email,
      :twitter_username
    )
  end
end
