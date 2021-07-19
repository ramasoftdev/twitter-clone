require "faker"

User.find_or_initialize_by(email: "koombean@email.com", username: "koombeanuser")
    .update(
      name: "Koombeanname",
      lastname: "Koombeanlastname",
      password: "pass12345",
      password_confirmation: "pass12345",
    )

(1..20).each do |id|
  User.find_or_initialize_by(email: Faker::Internet.email, username: Faker::Internet.username)
    .update(
      name: Faker::Name.first_name,
      lastname: Faker::Name.last_name,
      password: "pass12345",
      password_confirmation: "pass12345",
    )
end

puts "#{User.all.count} of 20 users Created"
