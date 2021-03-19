require "rails_helper"

RSpec.describe ProfileInfoHelper, type: :helper do
  include Devise::TestHelpers

  let!(:user) { create(:user) }

  before (:each) do
    @user = user
    sign_in @user
  end

  describe "#following_count" do
    context "When a user follows at least one account" do
      let(:as_follower) { create(:follow, follower_user: @user) }
      it do
        as_follower
        expect(following_count(@user)).to eql(1)
      end
    end
  end

  describe "#followers_count" do
    context "When a user is followed by at least one account" do
      let(:as_following) { create(:follow, following_user: @user) }
      it do
        as_following
        expect(followers_count(@user)).to eql(1)
      end
    end
  end

  describe "#tweets_count" do
    context "When a user has a least one tweet" do
      let(:tweet) { create(:tweet, user: @user) }
      it do
        tweet
        expect(tweets_count(@user)).to eql(1)
      end
    end
  end
end
