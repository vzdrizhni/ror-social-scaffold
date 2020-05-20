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
    @friendship = current_user.confirmed_friendships.find_by(friend_id: params[:id])
    @friendship.destroy_duplicates
    # if @friendship # must be fixed
    #   @friendship.destroy
    redirect_to users_path, notice: 'Friend removed'
    # else
    #   redirect_to root_path, alert: 'You are not allowed to do this'
    # end
  end

  def reject
    @friendship = current_user.incoming_friendships.find_by(user_id: params[:id])
    @friendship.destroy
    redirect_to users_path, notice: 'Friendship request rejected'
  end

  def cancel
    @friendship = current_user.pending_friendships.find_by(friend_id: params[:id])
    @friendship.destroy
    redirect_to users_path, notice: 'Friendship request canceled'
  end

  # def hui
  #   @user = User.find(params[:id])
  #   current_user.confirm_friend(@user)
  #   redirect_to users_path, notice: 'U are now friends'
  # end
end
