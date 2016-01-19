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

FactoryGirl.define do
  factory :comment do
    text "Lorem ipsum dolor sit amet"
    user { FactoryGirl.create(:user) }
    post { FactoryGirl.create(:post) }
  end

end
