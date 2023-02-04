# CommentsController
class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    new_comment = Comment.new(text: params[:text], post: Post.find(params[:post_id]), author: current_user)
    if new_comment.save
      redirect_to user_posts_path
    else
      render :new
    end
  end

  # private

  # def comments_params
  #   params.require(:comment).permit(:text, post_id: Post.find(params[:post_id]), author_id: current_user)
  # end
end
