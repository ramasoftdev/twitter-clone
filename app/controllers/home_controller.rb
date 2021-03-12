# frozen_string_literal: true

# HomeController to render signed root_path or redirect to user's edition
class HomeController < ApplicationController
  before_action :check_user_att

  def index
    @tweets = (current_user.following_tweets).or(current_user.tweets).distinct.includes(:user)
                                             .order(updated_at: :desc)
                                             .paginate(page: params[:page], per_page: 10)
  end

  def check_user_att
    redirect_to edit_user_registration_path if user_signed_in? &&
                                               (current_user.name.to_s.blank? || current_user.lastname.to_s.blank?)
  end
end
