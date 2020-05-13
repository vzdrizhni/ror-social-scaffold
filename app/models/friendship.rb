class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates_presence_of :user_id, :friend_id
  validates_uniqueness_of :user, scope: :friend
  # validate :duplicate_check

  # def disallow_self_friendship
  #   if user_id == friend_id
  #     errors.add(:friend_id, "Can't friend yourself")
  #   end
  # end

  # def duplicate_check
  #   if Friendship.where(user_id: friend_id, friend_id: user_id).exists? && Friendship.where(user_id: user_id, friend_id: friend_id).exists?
  #     self.errors.add(:user_id, 'Already friends!')
  #   end
  # end

end
