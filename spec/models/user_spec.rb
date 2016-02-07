# == Schema Information
#
# Table name: users
#
#  id                         :integer          not null, primary key
#  name                       :string           default(""), not null
#  email                      :string           default(""), not null
#  encrypted_password         :string           default(""), not null
#  reset_password_token       :string
#  reset_password_sent_at     :datetime
#  remember_created_at        :datetime
#  sign_in_count              :integer          default(0), not null
#  current_sign_in_at         :datetime
#  last_sign_in_at            :datetime
#  current_sign_in_ip         :inet
#  last_sign_in_ip            :inet
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  profile_image_id           :string
#  profile_image_filename     :string
#  profile_image_size         :integer
#  profiel_image_content_type :string
#

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe "validations" do
    it 'should be invalid with name null' do
      user.name = nil
      expect(user).not_to be_valid
    end

    it 'should be invalid with email null' do
      user.email = nil
      expect(user).not_to be_valid
    end

    it 'should be invalid with password null' do
      user.password = nil
      expect(user).not_to be_valid
    end
  end
end
