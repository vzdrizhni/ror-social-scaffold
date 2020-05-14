module UsersHelper
  def confirm_button(friend)
    if current_user.friend_requests
      (link_to 'Accept', hui_user_path(friend), method: :put, class: 'accept btn btn-secondary profile-link') <<
      (link_to 'Reject', unfriend_user_path(friend), method: :delete, class: 'reject btn btn-secondary profile-link')
    end
  end

  def friendship_button_show(friend)
    if current_user != @user && !current_user.friend_requests.any?(@user)
      if friend.friend_requests.any?(current_user)
        link_to "Pending request", "#", class:'profile-link btn btn-secondary'
      elsif !current_user.friend?(friend)
        link_to 'Add friend', request_friendship_user_path(friend.id), method: :post, class: 'btn btn-secondary profile-link'
      else
        link_to 'Unfriend', unfriend_user_path(friend), method: :delete, class: 'btn btn-secondary profile-link'
      end
    elsif current_user.friend_requests.any?(@user)
      confirm_button(friend)
    end
  end
end
