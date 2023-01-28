# comment
class Comment < ApplicationRecord
  after_save :update_comments_counter
  belongs_to :user_id, class_name: 'User'
  belongs_to :post

  def update_comment_counter
    post_id = post.id
    Post.increment_counter(:comments_counter, post_id)
  end
end
