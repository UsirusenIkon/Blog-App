# users
class UsersController < ApplicationController
  def index
    @user = User.all.order('created_at DESC')
  end

  def show
    @user = User.all
  end
end
