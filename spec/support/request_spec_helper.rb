module RequestSpecHelper

  def login_user
    # Before each test, create and login the user
    # p "Entre aqui 1"
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      # p "user #{user.to_json}"
      # user.confirm! # Or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in user
    end
  end
end
