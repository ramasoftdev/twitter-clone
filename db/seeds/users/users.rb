users = [
  { email: "user1@email.com", username: "user1", password: "pass12345", name: "User firstname", lastname: "User firstlastname" },
  { email: "user2@email.com", username: "user2", password: "pass12345", name: "User secondname", lastname: "User secondlastname" },
  { email: "user3@email.com", username: "user3", password: "pass12345", name: "User thirdtname", lastname: "User thirdlastname" },
]

users.each { |user|
  puts "Adding #{user[:email]} #{user[:username]} #{user[:password]}"
  admn = User.find_or_initialize_by(email: user[:email])
    .update(
      username: user[:username],
      password: user[:password],
      password_confirmation: user[:password],
      name: user[:name],
      lastname: user[:lastname],
    )
}

puts "#{User.all.count} of #{users.size} users Created"
