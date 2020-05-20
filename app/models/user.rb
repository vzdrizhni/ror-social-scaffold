class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  scope :all_except_current, ->(user) { where.not(id: user) }
  # scope :friends_and_own_posts, -> { where(user: (friends + self)) }
  validate :friends_and_own_posts

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friendships
  # has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  has_many :confirmed_friendships, -> { where(confirmed: true) }, class_name: 'Friendship'
  has_many :friends, through: :confirmed_friendships

  has_many :pending_friendships, -> { where confirmed: false }, class_name: 'Friendship', foreign_key: 'user_id'
  has_many :pending_friends, through: :pending_friendships, source: :friend

  has_many :incoming_friendships, -> { where confirmed: false }, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :incoming_friends, through: :incoming_friendships, source: :user

  # def friends
  #   friends_array = friendships.map { |friendship| friendship.friend if friendship.confirmed }
  #   friends_array += inverse_friendships.map { |friendship| friendship.user if friendship.confirmed }
  #   friends_array.compact
  # end

  # def pending_friends
  #   friendships.map { |friendship| friendship.friend unless friendship.confirmed }.compact
  # end

  # def friend_requests
  #   inverse_friendships.map { |friendship| friendship.user unless friendship.confirmed }.compact
  # end

  # def confirm_friend(user)
  #   # self.update_attributes(confirmed: true)
  #   # Friendship.create!(friend_id: self.user_id,
  #   #                   user_id: self.friend_id,
  #   #                   confirmed: true)
  #   friendship = friendships.find { |friends| friends.user == user }
  #   friendship.confirmed = true
  #   friendship.save
  #   Friendship.create!(user: friendship.friend, friend: friendship.user)
  # end

  def confirm_friend(user)
    friendship = incoming_friendships.find_by(user_id: user)
    friendship.update(confirmed: true)
    Friendship.create(user: friendship.friend, friend: friendship.user, confirmed: true)
  end

  def friend?(user)
    friends.include?(user)
  end

  def friends_and_own_posts
    Post.where(user: (friend_ids + [id]))
  end

  def sent_request?(user)
    pending_friends.include? user
  end

  def has_pending_request_with(user)
    incoming_friends.include? user
  end
end
