require 'rails_helper'

RSpec.describe Follow, type: :model do
  
  subject { create(:follow) }
  
  describe 'Validations' do
    it 'is not valid without follower_user_id' do
      subject.follower_user_id = nil
      expect(subject).to_not be_valid
    end
  end
end
