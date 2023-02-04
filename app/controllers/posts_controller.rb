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

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.author_id = current_user.id
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      redirect_to user_posts_path
    else
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
