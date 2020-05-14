module UsersHelper
  def confirm_button(friend)
    if current_user.friend_requests
      (link_to 'Accept', hui_user_path(friend), method: :put, class: 'btn btn-secondary profile-link') <<
      (link_to 'Reject', unfriend_user_path(friend), method: :delete, class: 'btn btn-secondary profile-link')
    end
  end

  def friendship_button_show(friend)
    if current_user != @user
      if friend.friend_requests.any?(current_user)
        'Pending request'
      elsif !current_user.friend?(friend)
        link_to 'Add friend', request_friendship_user_path(friend.id), method: :post, class: 'profile-link'
      else
        link_to 'Unfriend', unfriend_user_path(friend), method: :delete, class: 'profile-link'
      end
    end
  end
end
