module ProfileInfoHelper
  def following_count
    current_user.following_users.count
  end

  def followers_count
    current_user.follower_users.count
  end

  def tweets_count
    current_user.tweets.count
  end
end
