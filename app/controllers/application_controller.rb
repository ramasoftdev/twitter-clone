class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :name, :lastname, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def following_count
    current_user.following_users.count
  end

  def followers_count
    current_user.followers_users.count
  end

  def tweets_count
    current_user.tweets.count
  end
end
