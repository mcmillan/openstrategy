class SuggestionsController < ApplicationController
  def create
    @suggestion = Suggestion.new(suggestion_params)

    if @suggestion.save
      head :no_content
    else
      render json: { errors: @suggestion.errors.full_messages }
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
