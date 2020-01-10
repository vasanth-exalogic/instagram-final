class HomeController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  def index
    following = current_user.followers.select("following")
    id = [current_user.id]
    following.each do |f|
      id << f.following
    end
    @posts = Post.select("id,user_id,caption,created_at,updated_at").where(user_id: id).order("updated_at DESC")
  end

  def profile
    @user = User.find_by(username: params[:id])
    @posts = Post.select("id").where(user_id: @user.id).order("created_at DESC")
    @temp = current_user.followers.select("id").where(following: @user.id)
    @followers = Follower.select("id").where(following: @user.id)
    @followings = @user.followers.select("id")
  end

  def upload
    @post = Post.new
  end

  def uploading
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      redirect_to new_post_path
    end
  end

  def posts
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    @likes = @post.likes.select("user_id")
    @temp = @post.likes.select("id").where(user_id: current_user.id)
    @comments = @post.comments.select("message,user_id,updated_at").order("updated_at ASC")
  end

  def find
    @users = User.all? { |e|  }
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :image, :caption)
  end

  def find_time(time)
    diff = Time.now - time.in_time_zone("Chennai")
    if (diff/60) == 0
      "few secs ago"
    elsif (diff/60) < 60
      (diff/60).to_s + " mins ago"
    elsif (diff/3600) < 24
      (diff/3600).to_s + " hours ago"
    else
      (diff/86400).to_s + " days ago"
    end
  end
end
