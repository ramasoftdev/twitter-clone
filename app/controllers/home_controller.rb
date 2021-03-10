class HomeController < ApplicationController
  before_action :check_user_att

  def index
    @tweets = (current_user.following_tweets).or(current_user.tweets).distinct.order(updated_at: :desc)
                                             .paginate(page: params[:page], per_page: 10)
    @users_tweets = current_user.following_users.where(id: @tweets.map(&:user_id).uniq).map{|user| user}.push(current_user)
  end

  def check_user_att
    if user_signed_in?
      if (current_user.name == "" || current_user.name.nil? || current_user.lastname == "" || current_user.lastname.nil?)
        # p "Entre aqui 3"
        redirect_to edit_user_registration_path
      end
    end
  end
end
