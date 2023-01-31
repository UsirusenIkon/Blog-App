# posts
class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end
end
