module FriendshipsHelper
  def confirm_button(user)
    (link_to 'Accept', hui_user_path(user), method: :put, class: 'accept btn btn-secondary profile-link') <<
      (link_to 'Reject', reject_user_path(user), method: :delete, class: 'reject btn btn-secondary profile-link')
  end

  def friendship_button(user)
    if current_user.pending_request_with user
      confirm_button(user)
    elsif current_user.friend? user
      link_to 'Remove friend', unfriend_user_path(user), method: :delete, class: 'profile-link btn btn-secondary'
    elsif current_user.sent_request? user
      link_to 'Cancel Request', cancel_user_path(user), method: :delete, class: 'profile-link btn btn-secondary'
    else
      link_to 'Add friend', request_friendship_user_path(user), method: :post, class: 'profile-link btn btn-secondary'
    end
  end
end
