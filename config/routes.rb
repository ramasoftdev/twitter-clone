Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { sessions: "users/sessions",
                                       registrations: "users/registrations",
                                       passwords: "users/passwords",
                                       confirmations: "users/confirmations" }
  root :to => "home#index"
  get "/home" => "home#index", :as => :home
  resources :tweets

  get "following_users" => "followships#following_users", :as => :following_users
  get "follower_users" => "followships#follower_users", :as => :follower_users
  get "follow_user/:username" => "followships#follow_user", :as => :follow_user, :constraints => { :username => /[\w+\.]+/ }
  get "user_tweets/:username" => "followships#user_tweets", :as => :user_tweets, :constraints => { :username => /[\w+\.]+/ }
  get "new_follow_user_by_username" => "followships#new_follow_user_by_username", :as => :new_follow_user_by_username
  post "create_follow_user_by_username" => "followships#create_follow_user_by_username", :as => :create_follow_user_by_username
  get "user_followship/:username/:followship_type" => "followships#user_followship", :as => :user_followship, :constraints => { :username => /[\w+\.]+/ }
end
