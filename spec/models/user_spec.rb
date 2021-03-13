require 'rails_helper'

RSpec.describe User, type: :model do

  subject { create(:user) }

  describe "relationships" do
    it { should have_many(:tweets) }
    it { should have_many(:following).class_name("Follow").with_foreign_key("follower_user_id") }
    it { should have_many(:follower).class_name("Follow").with_foreign_key("following_user_id") }
    it { should have_many(:following_users).through(:following).source(:following_user) }
    it { should have_many(:follower_users).through(:follower).source(:follower_user) }
    it { should have_many(:following_tweets).through(:following_users).source(:tweets) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_uniqueness_of(:username).case_insensitive }
    it { should allow_value("Name").for(:name) }
    it { should_not allow_value("Inv4lid_").for(:name) }
    it { should allow_value("Lastame").for(:lastname) }
    it { should_not allow_value("Inv4lid_").for(:lastname) }
  end
end
