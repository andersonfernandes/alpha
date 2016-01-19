class UserPost < ActiveRecord::Base
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  has_many :user_posts, class_name: 'UserPost', foreign_key: 'post_id'
  has_many :likers, through: :user_posts, source: :post
end
