require "faker"
FactoryBot.define do
  factory :tweet do
    twett_content { Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false) }
    user { FactoryBot(:user) }
  end
end
