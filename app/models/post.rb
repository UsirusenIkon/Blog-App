# post
class Post < ApplicationRecord
  after_save :posts_counter_update
  belongs_to :user, class_name: 'User'
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 250 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def posts_counter_update
    user_id = user.id
    User.increment_counter(:posts_counter, user_id)
  end

  def recent_comments
    Post.where(comments: self).order(created_at: :desc).limit(5)
  end
end
