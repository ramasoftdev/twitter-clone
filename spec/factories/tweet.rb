FactoryBot.define do
  factory :tweet do
    tweet_content { Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false) }
    user { create(:user) }
  end
end
