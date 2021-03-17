# frozen_string_literal: true

# Tweet Model
class Tweet < ApplicationRecord
  belongs_to :user

  validates :tweet_content, length: { maximum: 280, minimum: 2 }
  validates :tweet_content, presence: true
  validates :user_id, presence: true
end
