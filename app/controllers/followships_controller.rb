class FollowshipsController < ApplicationController
  
  def following_users
    @following_users = followings.paginate(page: params[:page], per_page: 10)
  end

  def follower_users
    @follower_users = current_user.follower_users.paginate(page: params[:page], per_page: 10)
    @unfollow_users = (@follower_users - followings).pluck(:email)
  end

  def follow_user
    user_following = User.find_by(username: params[:username])
    if current_user.following_users.exclude?(user_following)
      begin
        current_user.following.create(following_user: user_following)
        flash[:success] = "User is now being followed by you"
        redirect_to user_tweets_path(username: params[:username])
      rescue => e
        flash[:error] = e.message
        redirect_to follower_users
      end
    else
      flash[:error] = "An error has been ocurred"
      redirect_to follower_users
    end
  end

  def new_follow_user_by_username
  end

  def create_follow_user_by_username
    user_following = User.find_by(username: username_str)
    if user_following
      if current_user.followings.exclude?(user_following)
        begin
          current_user.following.create(following_user: user_following)
          flash[:success] = "User is now being followed by you"
          redirect_to user_tweets_path(username: username_str)
        rescue => e
          flash[:error] = e.message
          redirect_to new_follow_user_by_username_path(username: username_str)
        end
      else
        flash[:error] = "You already are following to @#{username_str}"
        redirect_to new_follow_user_by_username_path(username: username_str)
      end
    else
      flash[:error] = "Username not found"
      redirect_to new_follow_user_by_username_path(username: username_str)
    end
  end

  def user_tweets
    @user = User.where(username: params[:username]).first
    if !@user.nil?
      followings = Follow.where(following_user_id: @user.id, follower_user_id: current_user.id).count
      followers = Follow.where(following_user_id: current_user.id, follower_user_id: @user.id).count

      if followings > 0 || followers > 0
        @tweets = Tweet.where(user_id: @user.id)
          .order("tweets.updated_at DESC")
          .paginate(page: params[:page], per_page: 10)
      else
        redirect_to home_path
      end
    else
      flash[:error] = "User not found"
      redirect_to home_path
    end
  end

  def user_followship
    @user = User.where(username: params[:username]).first
    case params[:followship_type].to_i
    when 1
      @user_followings = followings.paginate(page: params[:page], per_page: 10)
      @unfollow_users = (@user_followings - @following_users).pluck(:email)
    when 2
      @users_followers = current_user.follower_users.paginate(page: params[:page], per_page: 10)
      @unfollow_users = (@users_followers - @following_users).pluck(:email)
    else
      redirect_to home_path
    end
    @followship_users = @user_followings ? @user_followings : @users_followers
  end

  private

  # Only allow a list of trusted parameters through.
  def followings_params
    params.permit(:username)
  end

  def followings
    @followings ||= current_user.following_users
  end
    
  def username_str
    (followings_params[:username].include? "@") ? followings_params[:username].split("@")[1] : followings_params[:username]
  end 
end
