# comment
class Comment < ApplicationRecord
  after_save :update_comment_counter
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  def update_comment_counter
    post.increment!(:comments_counter)
  end
end
