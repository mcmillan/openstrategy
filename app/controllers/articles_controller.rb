class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      head :no_content
    else
      render json: { errors: @article.errors.full_messages }
    end
  end

  def vote
    @article = Article.find(params[:id])

    vote = @article.votes.where(user: current_user).first

    if vote
      vote.destroy
    else
      @article.votes << Vote.new(user: current_user, positive: true)
    end

    @article.save!

    head :no_content
  end

  private

  def article_params
    params.require(:article).permit(
      :title,
      :description,
      :url
    )
  end
end
