# users
class UsersController < ApplicationController
  layout 'users'

  def index
    @users = User.all.order('created_at DESC')
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.all.where(author_id: params[:id])
  end
end
