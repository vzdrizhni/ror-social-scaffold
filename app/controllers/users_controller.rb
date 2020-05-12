class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
    @pending_request = current_user.friend_requests
  end

  #def pending_friendship(user)
    #if current_user.pending_friends

    #end
  #end
end
