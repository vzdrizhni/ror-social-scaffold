module UsersHelper
  def confirm_button(friend)
    if current_user.friend_requests
      (link_to 'Accept', hui_user_path(friend), method: :put, class: 'profile-link') <<
      (link_to 'Unfriend', unfriend_user_path(friend), method: :delete, class: 'profile-link')
    end
  end
end
