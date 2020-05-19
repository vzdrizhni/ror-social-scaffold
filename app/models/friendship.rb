class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  has_many :confirmed_friends, through: :friendships, source: :friend
  has_many :inverse_friends, through: :friendships, source: :user

  has_many :pending_friendships, through: :friendships, source: :friend
  has_many :pending_friends, through: :friendships, source: :user

  validates_presence_of :user_id, :friend_id
  validates_uniqueness_of :user_id, scope: :friend_id
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
