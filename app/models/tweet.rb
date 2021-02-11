class Tweet < ApplicationRecord
  belongs_to :user

  validates_length_of :twett_content, maximum: 280, minimum: 2
  validates :twett_content, presence: true
  validates :user_id, presence: true
end
