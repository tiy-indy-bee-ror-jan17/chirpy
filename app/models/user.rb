class User < ApplicationRecord
  has_many :posts
  has_secure_password
  has_secure_token
  acts_as_follower
  acts_as_followable

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  def avatar
    attributes[:avatar] || "https://robohash.org/#{username}.png"
  end


  def timeline
    following_ids = followees(User).pluck(:id)
    all_ids= following_ids << id
    Post.where(user_id: all_ids).order("created_at DESC")
  end
end
