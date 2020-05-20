module UsersHelper
  # def confirm_button(friend)
  #   (link_to 'Accept', hui_user_path(friend), method: :put, class: 'accept btn btn-secondary profile-link') <<
  #     (link_to 'Reject', unfriend_user_path(friend), method: :delete, class: 'reject btn btn-secondary profile-link')
  # end
  #
  # def confirm_friendship_button(user)
  #   if current_user.has_pending_with(user)
  #     confirm_button(user)
  #   else
  #     friendship_button(user)
  #   end
  # end
  #
  # def friendship_button_show(friend)
  #   if current_user != @user && current_user.pending_friend_ids.none?(@user)
  #     friendship_button(friend)
  #   elsif current_user.pending_friend_ids.include?(@user)
  #     confirm_button(friend)
  #   end
  # end
end
