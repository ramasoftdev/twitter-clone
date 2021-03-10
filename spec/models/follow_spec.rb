require "rails_helper"

RSpec.describe Follow, type: :model do
  
  subject {
    FactoryBot.create(:follow)
  }

  let(:invalid_follow) { FactoryBot.create(:invalid_follow) }
  
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
