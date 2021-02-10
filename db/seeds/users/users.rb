users = [
  { email: "user1@email.com", username: "user1", password: "pass12345" },
  { email: "user2@email.com", username: "user2", password: "pass12345" },
  { email: "user3@email.com", username: "user3", password: "pass12345" },
]

users.each { |user|
  puts "Adding #{user[:email]} #{user[:username]} #{user[:password]}"
  admn = User.find_or_initialize_by(email: user[:email])
    .update(
      username: user[:username],
      password: user[:password],
      password_confirmation: user[:password],
    )
}

puts "#{User.all.count} of #{users.size} users Created"
