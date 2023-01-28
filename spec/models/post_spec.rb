require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.create(
      name: 'Doe',
      photo: 'https://doe.com/me.png',
      bio: 'Iam John Doe.',
      posts_counter: 0
    )
  end

  subject do
    Post.new(
      title: 'Post',
      text: 'It is valid',
      likes_counter: 0,
      user_id: @user.id,
      comments_counter: 2
    )
  end

  before { subject.save }

  context 'Return valid data' do
    it 'should accept a title' do
      subject.title = 'About'
      expect(subject).to be_valid
    end

    it 'should accept a text' do
      subject.text = 'It is valid'
      expect(subject).to be_valid
    end

    it 'should accept a likes_counter' do
      subject.likes_counter = 2
      expect(subject).to be_valid
    end

    it 'should accept a comments_counter' do
      subject.comments_counter = 2
      expect(subject).to be_valid
    end
  end

  context 'Return invalid data' do
    it 'should not accept blank title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'should not accept negative likes_counter' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end

    it 'should not accept negative comments_counter' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'should not accept non numerical likes_counter' do
      subject.likes_counter = 'likes'
      expect(subject).to_not be_valid
    end

    it 'should not accept non numerical comments_counter' do
      subject.comments_counter = 'comments'
      expect(subject).to_not be_valid
    end
  end
end
