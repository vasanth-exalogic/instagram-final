class LikeController < ApplicationController
  def create
    post = Post.find(params[:id])
    current_user.likes.create(post_id: post.id)
      redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:id])
    like = Like.select("id").where(user_id: current_user.id, post_id: post.id)
    like = Like.find(like.ids[0])
    like.delete
      redirect_to post_path(post)
  end

  def create1
    post = Post.find(params[:id])
    current_user.likes.create(post_id: post.id)
      redirect_to root_path
  end

  def destroy1
    post = Post.find(params[:id])
    like = Like.select("id").where(user_id: current_user.id, post_id: post.id)
    like = Like.find(like.ids[0])
    like.delete
      redirect_to root_path
  end
end
