class RelationshipsController < ApplicationController
  respond_to :js

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    if @user.following?(current_user)
      Conversation.create!(sender_id: current_user.id, recipient_id: @user.id)
    end
    respond_with @user
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_with @user
  end
end
