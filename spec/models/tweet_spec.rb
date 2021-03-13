require 'rails_helper'

RSpec.describe Tweet, type: :model do
<<<<<<< HEAD
  
  subject {
    FactoryBot.create(:tweet)
  }
=======
>>>>>>> factoryBot-addition

  subject { create(:tweet) }

<<<<<<< HEAD
  describe "~> #{described_class}`s associations" do
    it { should belong_to(:user) }
  end

  describe "~> #{described_class}`s validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is invalid with invalid attributes" do
      expect(invalid_tweet).to_not be_valid
    end
=======
  describe 'Validations' do
>>>>>>> factoryBot-addition

    it 'is not valid id twett_content is greater than 280 characters' do
      subject.twett_content = 'a' * 281
      expect(subject).to_not be_valid
    end

    it 'is not valid id twett_content is lower than 1 characters' do
      subject.twett_content = 'a' * 1
      expect(subject).to_not be_valid
    end

    it 'is not valid id twett_content is lower is empty or null' do
      subject.twett_content = ''
      expect(subject).to_not be_valid
    end

    it 'is not valid id user_id is null' do
      subject.user_id = ''
      expect(subject).to_not be_valid
    end
  end
end
