# like
class Like < ApplicationRecord
  after_save :update_likes_counter
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
