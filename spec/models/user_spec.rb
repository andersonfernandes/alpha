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

RSpec.describe User, type: [:model, :user] do
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

  describe "#follow" do
    let(:user_2) { create(:user) }

    before do
      user.save
      user.follow user_2
    end

    it 'sould add the user to the following list' do
      expect(user.following).to include user_2
    end
  end

  describe "#unfollow" do
    let(:user_2) { create(:user) }

    before do
      user.save
      UserRelationship.create follower: user, followed: user_2
      user.unfollow user_2
    end

    it 'sould add the user to the following list' do
      expect(user.following).not_to include user_2
    end
  end
end
