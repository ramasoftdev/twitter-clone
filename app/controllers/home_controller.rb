class HomeController < ApplicationController
  before_action :check_user_att

  def index
    @tweets = Tweet.select("tweets.*, U.name, U.lastname, U.username").joins("INNER JOIN users U ON (tweets.user_id = U.id)")
                   .where("U.id IN (?)", User.joins("INNER JOIN follows F ON (F.following_user_id = users.id) ")
                                             .where("F.follower_user_id = #{current_user.id}").pluck("users.id").push(current_user.id))
                   .order("tweets.updated_at DESC")
                   .paginate(page: params[:page], per_page: 10)
  end

  def check_user_att
    if user_signed_in?
      if (current_user.name == "" || current_user.name.nil? || current_user.lastname == "" || current_user.lastname.nil?)
        p "Entre aqui 3"
        redirect_to edit_user_registration_path
      end
    end
  end
end
