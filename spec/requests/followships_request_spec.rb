require "rails_helper"
require "shared_contexts"

RSpec.describe "Followships", type: :request do
  include_context "api request authentication helper methods"
  include_context "api request global before and after hooks"

  let!(:user) { create(:user) }
  let(:user_second) { create(:user) }
  let(:user_third) { create(:user).as_json }
  let!(:tweet) { create(:tweet) }
  let!(:follow) { create(:follow, follower_user_id: user.id, following_user_id: user_second.id) }

  before(:each) do
    @current_user = :user
    login_as(user, scope: :user)
  end

  describe "GET /following_users" do
    it "renders a successful response" do
      get following_users_url
      expect(response).to be_successful
    end
  end

  describe "GET /follower_users" do
    it "renders a successful response" do
      get follower_users_url
      expect(response).to be_successful
    end
  end

  describe "GET /follow_user" do
    it "redirect to user`s tweets if user is not followed yet" do
      get "/follow_user/#{user_third['username']}"
      expect(response).to redirect_to(user_tweets_path(username: user_third['username']))
    end

    it "is not successful if follow record is already present" do
      get "/follow_user/#{user_third['username']}"
      expect(response).to_not be_successful
    end
  end

  describe "GET /user_tweets/:username" do
    it "renders a successful response" do
      get user_tweets_url(follow.follower_user.username)
      expect(response).to be_successful
    end

    it "renders a successful response" do
      get user_tweets_url(follow.follower_user.username)
      expect(response).to be_successful
    end
  end

  describe "GET new_follow_user_by_username" do
    it "renders a successful response" do
      get user_tweets_path(user_third["username"])
      expect(response).to_not be_successful
    end
  end

  describe "POST create_follow_user_by_username" do
    context "with valid parameters" do
      it "creates a new Follow" do
        expect {
          post create_follow_user_by_username_url, params: { username: user_third["username"] }
        }.to change(Follow, :count).by(1)
      end

      it "redirects to the created Follow" do
        post create_follow_user_by_username_url, params: { username: user_third["username"] }
        expect(response).to redirect_to(user_tweets_path(username: user_third["username"]))
      end
    end

    context "with invalid parameters" do
      let(:user_to_follow) { User.find(follow.following_user_id) }
      it "does not create a new Follow" do
        expect {
          post create_follow_user_by_username_url, params: { username: user_to_follow.username }
        }.to change(Follow, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post create_follow_user_by_username_url, params: { username: user_to_follow.username }
        expect(response).to redirect_to(new_follow_user_by_username_path(username: user_to_follow.username))
      end
    end
  end

  describe "GET /user_followship" do
    # followship_type 1 get an unsername's followers list
    context "with username and followship_type 1 renders a successful response" do
      it "renders a successful response" do
        get "/user_followship/#{user_second.username}/1"
        expect(response).to be_successful
      end
    end

    # followship_type 1 get an unsername's following list
    context "with username and followship_type 2 renders a successful response" do
      it "renders a successful response" do
        get user_followship_url(user_second.username, 2)
        expect(response).to be_successful
      end
    end

    context "with username and without followship_type 1 or 2 redirect to home_path" do
      it "renders a successful response" do
        get user_followship_url(user_second.username, nil.to_i)
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
