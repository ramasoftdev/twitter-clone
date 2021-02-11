require "rails_helper"

RSpec.describe User, type: :model do
  subject {
    described_class.new(username: "username1",
                        email: "username1@email.com",
                        name: "Firstusername",
                        lastname: "Firstuserlastname",
                        password: "username1pass",
                        password_confirmation: "username1pass")
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
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
