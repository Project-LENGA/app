require 'rails_helper'

describe User do
  describe 'basics' do
    it 'should be created' do
      user_count = User.all.count
      create(:user)
      expect(User.all.count).to eq(user_count + 1)
    end
  end

  describe 'validation' do
    it 'should have name' do
      user = build(:user, name: '')
      expect(user).not_to be_valid
    end

    it 'should have email' do
      user = build(:user, email: '')
      expect(user).not_to be_valid
    end
  end
end
