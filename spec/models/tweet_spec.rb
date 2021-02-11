require "rails_helper"

RSpec.describe Tweet, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:user) {
    User.create(username: "username1",
                email: "username1@email.com",
                name: "Firstusername",
                lastname: "Firstuserlastname",
                password: "username1pass",
                password_confirmation: "username1pass")
  }

  subject {
    described_class.new(twett_content: "Valid tweet text",
                        user_id: user.id)
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid id twett_content is greater than 280 characters" do
      subject.twett_content = "a" * 281
      expect(subject).to_not be_valid
    end

    it "is not valid id twett_content is lower than 1 characters" do
      subject.twett_content = "a" * 1
      expect(subject).to_not be_valid
    end

    it "is not valid id twett_content is lower is empty or null" do
      subject.twett_content = ""
      expect(subject).to_not be_valid
    end

    it "is not valid id user_id is null" do
      subject.user_id = ""
      expect(subject).to_not be_valid
    end
  end
end
