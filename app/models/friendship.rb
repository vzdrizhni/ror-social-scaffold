class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates_presence_of :user_id, :friend_id
  validates_uniqueness_of :user, scope: :friend
  validates_uniqueness_of :friend, scope: :user
  validate :disallow_self_friendship
  validate :duplicate_check

  def disallow_self_friendship
    errors.add(:friend_id, "Can't friend yourself") if user_id == friend_id
  end

  def duplicate_check
    return unless Friendship.where(user_id: friend_id,
                                   friend_id: user_id).exists? && Friendship.where(user_id: user_id,
                                                                                   friend_id: friend_id).exists?

    errors.add(:user_id, 'Already friends!')
  end
end
