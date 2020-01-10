class FollowersController < ApplicationController
  def create
    user = User.find(params[:id])
    current_user.followers.create(following: user.id)
    redirect_to profile_path(user.username)
  end

  def destroy
    follower = Follower.find(params[:id])
    user = User.find(follower.following)
    follower.delete
    redirect_to profile_path(user.username)
  end
end
