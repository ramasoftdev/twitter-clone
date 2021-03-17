require "faker"

User.all.pluck(:id).each do |id|
  (1..25).each do |inner_id|
    tweet = Tweet.new
    tweet.tweet_content = Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false)
    tweet.user_id = id
    tweet.save
  end
end

puts "#{Tweet.all.count} Tweet Created"
