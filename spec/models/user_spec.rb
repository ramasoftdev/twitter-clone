require "rails_helper"

RSpec.describe User, type: :model do
  subject { FactoryBot.create(:user) }
  let(:invalid_user) { FactoryBot.create(:invalid_user) }

  describe "Validations" do
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
