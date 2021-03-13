require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject { create(:user) }

  describe 'Validations' do
    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an username' do
      subject.username = nil
      expect(subject).to_not be_valid
    end
  end
end
