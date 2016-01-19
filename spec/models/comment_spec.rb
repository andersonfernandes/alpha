# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  text       :string           not null
#  user_id    :integer          not null
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { build(:comment) }

  describe "validations" do
    it 'should be invalid without text' do
      comment.text = nil
      expect(comment).not_to be_valid
    end

    it 'should be invalid without user' do
      comment.user = nil
      expect(comment).not_to be_valid
    end

    it 'should be invalid without post' do
      comment.post = nil
      expect(comment).not_to be_valid
    end
  end
end
