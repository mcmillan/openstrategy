class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_community_user!

  def new
    @reply = Reply.new(
      parent_id: params[:parent_id],
      parent_type: params[:parent_type].classify
    )
  end

  def create
    @reply = Reply.new(reply_params)
    @reply.user = current_user

    if @reply.save
      redirect_to @reply.original_post
    else
      render 'new'
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:parent_id, :parent_type, :body)
  end
end
