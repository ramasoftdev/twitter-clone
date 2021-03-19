ActiveAdmin.register Tweet do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :tweet_content, :user_id

  # show title: "My Tweet" do
  #   h2 "#{tweet.tweet_content}"

  #   div do
  #     h3 "Id: #{tweet.id}"
  #     h3 "Username: #{link_to "#{tweet.user.username}", admin_user_path(tweet.user)}".html_safe
  #     h3 "You created this tweet on #{tweet.created_at.strftime('%a %b %e, %Y at %I%M %p')}"
  #   end
  # end
  
  #
  # or
  #
  # permit_params do
  #   permitted = [:tweet_content, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
