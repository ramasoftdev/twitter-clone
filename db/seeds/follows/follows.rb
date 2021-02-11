User.all.pluck(:id).each do |id|
  (1..10).each do |inner_id|
    rand_number = User.where.not(id: id).pluck(:id).sample
    Follow.find_or_initialize_by(following_user_id: rand_number, follower_user_id: id)
          .update(follower_user_id: id)
  end
end

puts "#{Follow.all.count} Follow Created"
