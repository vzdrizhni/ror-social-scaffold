class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  has_many :confirmed_friends, through: :friendships, source: :friend
  has_many :inverse_friends, through: :friendships, source: :user

  validates_presence_of :user_id, :friend_id
  validate :disallow_self_friendship
  def disallow_self_friendship
    errors.add(:friend_id, "Can't friend yourself") if user_id == friend_id
  end

  def destroy_duplicates
    inverse = Friendship.find_by(user_id: friend, friend_id: user)
    destroy
    inverse.destroy
  end
end
