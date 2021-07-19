# frozen_string_literal: true

# Follow Model
class Follow < ApplicationRecord
  belongs_to :following_user, class_name: 'User'
  belongs_to :follower_user, class_name: 'User'

  validates :following_user_id, presence: true
  validates :follower_user_id, presence: true
end
