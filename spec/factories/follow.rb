FactoryBot.define do
  factory :follow do
    following_user { create(:user) }
    follower_user {  create(:user) }
  end
end
