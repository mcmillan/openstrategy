class SuggestionsController < ApplicationController
  def new
    @suggestion = Suggestion.new
  end
  
  def create
    @suggestion = Suggestion.new(suggestion_params)
    
    if @suggestion.save
      redirect_to root_path
    else
      render 'new'
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
