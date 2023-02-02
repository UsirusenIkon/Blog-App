# posts
class PostsController < ApplicationController
  def index
    @posts = Post.includes(:comments).where(author_id: params[:user_id])
    @user = User.where(id: params[:user_id]).first
    @comments = Comment.includes(:author).order(created_at: :desc)
    @like = Like.all
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.where(id: params[:user_id]).first
    @comments = Comment.includes(:author).where(id: params[:user_id]).order(created_at: :desc)
  end
end
