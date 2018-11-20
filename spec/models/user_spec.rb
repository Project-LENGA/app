# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  provider               :string
#  uid                    :string
#  image                  :text
#  time_zone              :string           default("Tokyo"), not null
#  student_activated      :boolean          default(FALSE)
#  tutor_activated        :boolean          default(FALSE)
#

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
