module UsersHelper
#include User

  def confirm_button(friend)
    if current_user.friend_requests
      link_to 'Accept'
    end
  end

end