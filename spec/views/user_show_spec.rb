require 'rails_helper'
RSpec.describe 'User show page', type: :system do
  before(:each) do
    @user = User.create(
      name: 'Ikon',
      photo: 'https://i.imgur.com/9yG7zZT.jpg',
      bio: 'I love basketball',
      posts_counter: 1
    )
    @user1 = User.create(
      name: 'Ikon',
      photo: 'https://i.imgur.com/9yG7zZT.jpg',
      bio: 'I love basketball',
      posts_counter: 1
    )
    @post1 = Post.create(author: @user, title: 'Intro', body: 'This is my first post')
    @post2 = Post.create(author: @user1, title: 'Promo', body: 'hello ya`ll!')
    @post3 = Post.create(author: @user1, title: 'Volvo', body: 'Great Logo!')
    visit user_path(id: @user.id)
  end

  it 'should show the profile picture for each user' do
    visit user_path(id: @user.id)
    expect(page).to have_css("img[src*='https://i.imgur.com/9yG7zZT.jpg']")
  end

  it 'should show user\'s username' do
    visit user_path(id: @user.id)
    expect(page).to have_content('Ikon')
  end

  it 'should show the number of posts the user has written' do
    visit user_path(id: @user.id)
    expect(page).to have_content(@user.posts_counter)
  end

  it 'should show the user\'s bio' do
    visit user_path(id: @user.id)
    expect(page).to have_content(@user.bio)
  end

  it 'should see the user\'s first 3 posts' do
    visit user_path(id: @user.id)
    expect(page).to have_content(@post1.title)
    expect(page).to have_content(@post2.body)
  end

  it 'should see a button that lets me view all of a user\'s posts.' do
    visit user_path(id: @user.id)
    expect(page).to have_css('btn')
  end

  it 'should redirect me to that post\'s show page.' do
    visit user_path(id: @user.id)
    click_link('See all posts')
    expect(page).to have_current_path(user_posts_path(@user))
  end

  it 'should redirect me to that post\'s index show page.' do
    visit user_path(id: @user.id)
    click_link(@post1.title)
    expect(page).to have_current_path(user_post_path(user_id: @user.id, id: @post.id))
  end
end