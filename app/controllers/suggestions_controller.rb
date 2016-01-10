class SuggestionsController < ApplicationController
  def new
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)

    if @suggestion.save
      redirect_to root_url, notice: "Thanks! We've got your suggestion. Hopefully you'll see it on the site soon!"
    else
      render :new
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
