require "rails_helper"

RSpec.describe Follow, type: :model do
  # setup
  let(:user1) {
    User.create(username: "username1",
                email: "username1@email.com",
                name: "Firstusername",
                lastname: "Firstuserlastname",
                password: "username1pass",
                password_confirmation: "username1pass")
  }

  let(:user2) {
    User.create(username: "username2",
                email: "username2@email.com",
                name: "Secondtusername",
                lastname: "Seconduserlastname",
                password: "username2pass",
                password_confirmation: "username2pass")
  }

  subject {
    described_class.new(following_user_id: user1.id, follower_user_id: user2.id)
  }
  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without following_user_id" do
      subject.following_user_id = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without follower_user_id" do
      subject.follower_user_id = nil
      expect(subject).to_not be_valid
    end
  end
end
