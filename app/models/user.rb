# user
class User < ApplicationRecord
  has_many :post
  has_many :comments, through: :post
  has_many :likes, through: :post

  def recent_posts
    Post.where(author: self).order(created_at: :desc).limit(3)
  end
end
