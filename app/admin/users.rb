ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username, :name, :lastname
  
  index do
    selectable_column
    column 'Full name' do |usr|
      link_to usr.name+' '+usr.lastname, admin_user_path(usr)
    end
    column 'Username' do |usr|
      link_to usr.username, admin_user_path(usr)
    end
    column 'Created at' do |usr|
      usr.created_at
    end
    column 'Updated at' do |usr|
      usr.updated_at
    end
    column 'Indv actions' do |usr|
      "#{(link_to 'Edit ', edit_admin_user_path(usr)).html_safe} &nbsp; #{(link_to 'Delete ', admin_user_path(usr), rel: "nofollow", method: "delete").html_safe}".html_safe
    end
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username, :name, :lastname]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
