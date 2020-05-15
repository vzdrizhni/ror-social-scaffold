class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
    @pending_request = current_user.friend_requests
  end

  def hui
    @user = User.find(params[:id])
    current_user.confirm_friend(@user)
    redirect_to users_path, notice: 'U are now friends'
  end
end
