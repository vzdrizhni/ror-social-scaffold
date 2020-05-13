class FriendshipsController < ApplicationController

  def index
    @friends = current_user.friendships.all
  end

  def create
    @friendship = current_user.friendships.build(friend_id: params[:id], confirmed: false)
    if @friendship.save
      redirect_to user_path, notice: 'Friendship request sent!'
    else
      redirect_to users_path, notice: 'Friendship Already Sent!'
    end

  end

  def destroy

  end

  #def friendship_params
   # params.fetch(:friendship).permit(:user_id, :friend_id, :confirmed)
  #end

end
