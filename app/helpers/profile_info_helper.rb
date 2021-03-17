module ProfileInfoHelper
  def following_count(user = nil)
    user ? user.following_users.count : current_user.following_users.count
  end

  def followers_count(user = nil)
    user ? user.follower_users.count : current_user.follower_users.count
  end

  def tweets_count(user = nil)
    user ? user.tweets.count : current_user.tweets.count
  end
end
