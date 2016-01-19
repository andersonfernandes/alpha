# == Schema Information
#
# Table name: user_posts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :user_post do
    user { FactoryGirl.create(:user) }
    post { FactoryGirl.create(:post) }
  end

end
