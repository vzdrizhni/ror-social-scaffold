class FriendshipsController < ApplicationController
  def index
    @friends = current_user.friendships.all
  end

  def create
    @friendship = current_user.friendships.build(friend_id: params[:id], confirmed: false)
    if @friendship.save
      redirect_to users_path, notice: 'Friendship request sent!'
    else
      redirect_to users_path, alert: 'Friendship Already Sent!'
    end
  end

  def destroy
    @friendship = Friendship.find_by(params[:user_id], friend_id: params[:id])
    if @friendship
      @friendship.destroy
      redirect_to users_path, notice: 'Friend removed'
    else
      redirect_to root_path, alert: 'You are not allowed to do this'
    end
  end
end
