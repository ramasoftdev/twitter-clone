require 'rails_helper'
require "shared_contexts"

RSpec.describe "Homes", type: :request do

  include_context "api request authentication helper methods"
  include_context "api request global before and after hooks"

  let!(:user) { FactoryBot.create(:user) }

  before(:each) do
    @current_user = :user
    login_as(user, scope: :user)
  end

  describe "GET /index" do
    it "returns http success" do
      get "/home"
      expect(response).to have_http_status(:success)
    end
  end

end
