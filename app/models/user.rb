class User < ApplicationRecord
  #Associations
  has_many :tweets
  
  has_many :following, class_name: 'Follow', foreign_key: 'follower_user_id'
  has_many :following_users, through: :following, source: :following_user

  has_many :follower, :class_name => 'Follow', foreign_key: 'following_user_id'
  has_many :follower_users, through: :follower, source: :follower_user

  has_many :following_tweets, through: :following_users, source: :tweets

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_writer :login

  # Only allow letter, number, underscore and punctuation.
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  validate :validate_username

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def login
    @login || self.username || self.email
  end

  private

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_h).first
    end
  end
end
