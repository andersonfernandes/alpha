# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  text               :string           not null
#  user_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_id           :string
#  image_filename     :string
#  image_size         :integer
#  image_content_type :string
#

class Post < ActiveRecord::Base
  attachment :image

  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  validates_presence_of :text, :user_id
end
