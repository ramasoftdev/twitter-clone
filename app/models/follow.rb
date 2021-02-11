class Follow < ApplicationRecord
  belongs_to :following_user, :class_name => "User"
  belongs_to :follower_user, :class_name => "User"

  validates_presence_of :following_user_id
  validates_presence_of :follower_user_id
end
