Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { sessions: "users/sessions",
                                       registrations: "users/registrations",
                                       passwords: "users/passwords",
                                       confirmations: "users/confirmations" }
  root :to => "home#index"
  get "home" => "home#index", :as => :home
  resources :tweets

  get "following_users" => "home#following_users", :as => :following_users
  get "follower_users" => "home#follower_users", :as => :follower_users
  get "follow_user/:username" => "home#follow_user", :as => :follow_user
  get "user_tweets/:username" => "home#user_tweets", :as => :user_tweets
  get "new_follow_user_by_username" => "home#new_follow_user_by_username", :as => :new_follow_user_by_username
  post "create_follow_user_by_username" => "home#create_follow_user_by_username", :as => :create_follow_user_by_username
  get "user_followship/:username/:followship_type" => "home#user_followship", :as => :user_followship
end
