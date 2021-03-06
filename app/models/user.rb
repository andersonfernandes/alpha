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

class User < ActiveRecord::Base
  attachment :profile_image

  has_many :posts, class_name: 'Post', foreign_key: 'user_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'user_id'

  has_many :user_posts, class_name: 'UserPost', foreign_key: 'user_id'
  has_many :liked_posts, through: :user_posts, source: :user

  has_many :active_relationships, class_name: 'UserRelationship',
                                  foreign_key: 'follower_id',
                                  dependent: :destroy
  has_many :passive_relationships, class_name: 'UserRelationship',
                                   foreign_key: 'followed_id',
                                   dependent:   :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name, :email
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true,  on: :create

  def follow user
    active_relationships.create followed: user
  end

  def unfollow user
    user_relation = active_relationships.find_by(followed_id: user.id)
    user_relation.destroy if user_relation
  end
end
