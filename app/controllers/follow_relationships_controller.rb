class FollowRelationshipsController < ApplicationController
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)    
    redirect_to user_path(user)
  end

  def destroy
    user = FollowRelationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user_path(user)
  end
end
