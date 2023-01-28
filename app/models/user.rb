# user
class User < ApplicationRecord
  has_many :post
  has_many :comments, through: :post
  has_many :likes, through: :post

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    Post.where(user_id: id).order(created_at: :desc).limit(3)
  end
end
