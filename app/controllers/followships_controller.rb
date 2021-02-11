class FollowshipsController < ApplicationController
  before_action :set_following_users, only: [:following_users, :follower_users, :user_followship]

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
      flash[:success] = "User is now being followed by you"
      redirect_to user_tweets_path(username: params[:username])
    else
      flash[:error] = @follow.errors.full_messages
      redirect_to follower_users
    end
  end

  def new_follow_user_by_username
  end

  def create_follow_user_by_username
    username_str = (params[:username].include? "@") ? params[:username].split("@")[1] : params[:username]
    user_following = User.where(username: username_str).first
    if !user_following.nil?
      @follow = Follow.new
      @follow.follower_user_id = current_user.id
      @follow.following_user_id = user_following.id
      if Follow.where(follower_user_id: current_user.id, following_user_id: user_following.id).count === 0
        if @follow.save
          flash[:success] = "User is now being followed by you"
          redirect_to user_tweets_path(username: username_str)
        else
          flash[:error] = @follow.errors.full_messages
          redirect_to new_follow_user_by_username_path(username: username_str)
        end
      else
        flash[:error] = "you already are following to @#{username_str}"
        redirect_to new_follow_user_by_username_path(username: username_str)
      end
    else
      flash[:error] = "username not found"
      redirect_to new_follow_user_by_username_path(username: username_str)
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

  def user_followship
    @user = User.where(username: params[:username]).first
    case params[:followship_type].to_i
    when 1
      @user_followings = User.joins("INNER JOIN follows F ON (F.follower_user_id = users.id) ")
        .where("F.following_user_id = #{@user.id}")
        .order("users.name ASC, users.lastname ASC, users.username ASC, users.email ASC")
        .paginate(page: params[:page], per_page: 10)

      @unfollow_users = (@user_followings - @following_users).pluck(:email)
    when 2
      @users_followers = User.joins("INNER JOIN follows F ON (F.following_user_id = users.id) ")
        .where("F.follower_user_id = #{@user.id}")
        .order("users.name ASC, users.lastname ASC, users.username ASC, users.email ASC")
        .paginate(page: params[:page], per_page: 10)

      @unfollow_users = (@users_followers - @following_users).pluck(:email)
    else
      redirect_to home_path
    end
    @followship_users = !@user_followings.nil? ? @user_followings : @users_followers
  end

  private

  def set_following_users
    @following_users = User.joins("INNER JOIN follows F ON (F.following_user_id = users.id) ")
                           .where("F.follower_user_id = #{current_user.id}")
                           .order("users.name ASC, users.lastname ASC, users.username ASC, users.email ASC")
                           .paginate(page: params[:page], per_page: 10)
  end
end
