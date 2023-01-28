require 'rails_helper'

RSpec.describe 'counter' do
  it 'increments when a new comment is created' do
    first_post = Post.create(author: User.create(name: 'Tom'), title: 'Hi', text: 'This is the first post')
    second_user = User.create(name: 'Jerry')
    expect { Comment.create(post_id: first_post.id, author_id: second_user.id, text: 'Hi Tom!') }.to change {
                                                                                                       Comment.count
                                                                                                     }.by(1)
  end
end
