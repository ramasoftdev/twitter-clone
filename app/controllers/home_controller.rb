class HomeController < ApplicationController
  before_action :set_following_users, only: [:following_users, :follower_users]

  def index
  end

  def following_users
  end

  def follower_users
    @follower_users = User.joins("INNER JOIN follows F ON (F.follower_user_id = users.id) ")
                          .where("F.following_user_id = #{current_user.id}")
                          .order("users.name ASC, users.lastname ASC, users.username ASC, users.email ASC")
                          .paginate(page: params[:page], per_page: 10)
    @unfollow_users = (@follower_users - @following_users).pluck(:email)
  end

  def follow_user
    @follow = Follow.new
    @follow.follower_user_id = current_user.id
    @follow.following_user_id = User.where(username: params[:username]).first.id
    if @follow.save
      redirect_to user_tweets_path(username: params[:username])
    else
      redirect_to follower_users
    end
  end

  def user_tweets
    @user = User.where(username: params[:username]).first
    followings = Follow.where(following_user_id: @user.id, follower_user_id: current_user.id).count
    followers = Follow.where(following_user_id: current_user.id, follower_user_id: @user.id).count

    if followings > 0 || followers > 0
      @tweets = Tweet.where(user_id: @user.id)
                     .order("tweets.updated_at DESC")
                     .paginate(page: params[:page], per_page: 10)
    else
      redirect_to home_path
    end
  end

  private

  def set_following_users
    @following_users = User.joins("INNER JOIN follows F ON (F.following_user_id = users.id) ")
                           .where("F.follower_user_id = #{current_user.id}")
                           .order("users.name ASC, users.lastname ASC, users.username ASC, users.email ASC")
                           .paginate(page: params[:page], per_page: 10)
  end
end
