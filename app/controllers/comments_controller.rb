class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.post_id = params[:id]
    comment.save
    redirect_to post_path(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:id,:user_id,:post_id,:message)
  end
end
