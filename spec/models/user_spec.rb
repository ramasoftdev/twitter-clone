require "rails_helper"

RSpec.describe User, type: :model do
  subject { FactoryBot.create(:user) }
  let(:invalid_user) { FactoryBot.create(:invalid_user) }

  describe "~> #{described_class}`s associations" do
    it { should have_many(:tweets) }
    it { should have_many(:following).class_name("Follow").with_foreign_key("follower_user_id") }
    it { should have_many(:follower).class_name("Follow").with_foreign_key("following_user_id") }
    it { should have_many(:following_users).through(:following).source(:following_user) }
    it { should have_many(:follower_users).through(:follower).source(:follower_user) }
    it { should have_many(:following_tweets).through(:following_users).source(:tweets) }
  end

  describe "~> #{described_class}`s validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is invalid with invalid attributes" do
      expect(invalid_user).to_not be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an username" do
      subject.username = nil
      expect(subject).to_not be_valid
    end
  end
end
