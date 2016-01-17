class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_community_user!
  before_action :load_reply, only: [:edit, :update]

  def new
    @reply = Reply.new(
      parent_id: params[:parent_id],
      parent_type: params[:parent_type].classify
    )
  end

  def create
    @reply = Reply.new(new_reply_params)
    @reply.user = current_user

    if @reply.save
      redirect_to @reply.original_post
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @reply.update(existing_reply_params)
      redirect_to @reply.original_post
    else
      render 'edit'
    end
  end

  private

  def new_reply_params
    params.require(:reply).permit(:parent_id, :parent_type, :body)
  end

  def existing_reply_params
    params.require(:reply).permit(:body)
  end

  def load_reply
    @reply = Reply.where(user: current_user).where(id: params[:id]).take!
  end
end
