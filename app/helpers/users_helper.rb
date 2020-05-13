module UsersHelper
#include User

  def confirm_button(friend)
    if current_user.friend_requests
      link_to 'Accept', hui_user_path(friend), method: :put
    end
  end
end