require "faker"

FactoryBot.define do
  factory :tweet do
    twett_content { Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false) }
    user { FactoryBot.create(:user) }
  end

  factory :invalid_tweet, class: Tweet do
    to_create { |instance| instance.save(validate: false) }
    twett_content { Faker::Lorem.paragraph_by_chars(number: [1, 281].sample, supplemental: false) }
    user { FactoryBot.create(:user) }
  end
end
