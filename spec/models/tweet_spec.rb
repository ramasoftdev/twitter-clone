require "rails_helper"

RSpec.describe Tweet, type: :model do

  subject { create(:tweet) }

  describe "relationships" do
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_length_of(:twett_content).is_at_most(280) }
    it { should validate_length_of(:twett_content).is_at_least(2) }
    it { should validate_presence_of(:user_id) }
  end
end
