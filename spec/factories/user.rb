require "faker"

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Internet.username }
    name { Faker::Name.name }
    lastname { Faker::Name.last_name }
    password { "pass12345" }
    password_confirmation { password }
    # Add additional fields as required via your User model
    initialize_with {
      User.find_or_create_by(email: email,
                             username: username,
                             name: name,
                             lastname: lastname)
    }
  end

  factory :invalid_user, class: User do
    to_create {|instance| instance.save(validate: false) }
    email {""}
    username {""}
  end

  factory :user_second, class: User do
    email { Faker::Internet.email }
    username { Faker::Internet.username }
    name { Faker::Name.name }
    lastname { Faker::Name.last_name }
    password { "pass12345" }
    password_confirmation { password }
    # Add additional fields as required via your User model
    initialize_with {
      User.find_or_create_by(email: email,
                             username: username,
                             name: name,
                             lastname: lastname)
    }
  end

  factory :user_third, class: User do
    email { Faker::Internet.email }
    username { Faker::Internet.username }
    name { Faker::Name.name }
    lastname { Faker::Name.last_name }
    password { "pass12345" }
    password_confirmation { password }
    # Add additional fields as required via your User model
    initialize_with {
      User.find_or_create_by(email: email,
                             username: username,
                             name: name,
                             lastname: lastname)
    }
  end
end
