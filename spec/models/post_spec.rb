# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  text               :string           not null
#  user_id            :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_id           :string
#  image_filename     :string
#  image_size         :integer
#  image_content_type :string
#

require 'rails_helper'

RSpec.describe Post, type: [:model, :post] do
  let(:post) { build(:post) }

  describe "validations" do
    it 'should be invalid without text' do
      post.text = nil
      expect(post).not_to be_valid
    end

    it 'should be invalid without user' do
      post.user = nil
      expect(post).not_to be_valid
    end
  end
end
