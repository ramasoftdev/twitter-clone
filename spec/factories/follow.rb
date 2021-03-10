require "faker"

FactoryBot.define do
  factory :follow do
    following_user { FactoryBot.create(:user) }
    follower_user { FactoryBot.create(:user_second) }
  end

  factory :invalid_follow, class: Follow do
    to_create { |instance| instance.save(validate: false) }
    following_user { following_user }
    follower_user { following_user }
  end
end
