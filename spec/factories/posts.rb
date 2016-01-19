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

FactoryGirl.define do
  factory :post do
    text "Lorem ipsum dolor sit amet, consectetur adipisicing elit."
    user { FactoryGirl.create(:user) }
    image { StringIO.new("hello") }
  end

end
