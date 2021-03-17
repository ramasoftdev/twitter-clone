require 'rails_helper'

RSpec.describe Follow, type: :model do

  subject { create(:follow) }

  describe "relationships" do
    it { should belong_to(:following_user).class_name("User") }
    it { should belong_to(:follower_user).class_name("User") }
  end
  
  describe 'validations' do
    it { should validate_presence_of(:follower_user_id) }
    it { should validate_presence_of(:following_user_id) }
  end
end
