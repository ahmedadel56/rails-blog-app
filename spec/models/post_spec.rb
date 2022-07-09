require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  post = Post.create(user_id: user.id, title: 'Hello', text: 'This is my first post')
  10.times do |_i|
    Comment.create(post_id: post.id, user_id: user.id, text: 'Hi Tom!')
  end
  it 'is valid with valid attributes' do
    expect(post).to be_valid
  end
  it 'is not valid without a title' do
    post.title = nil
    expect(post).to_not be_valid
  end
  it 'Title must not exceed 250 characters' do
    post.title = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
     sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
     Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
      nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit
     in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
     cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    expect(post).to_not be_valid
  end
  it 'is not valid with a negative value for comments counter' do
    post.comment_counter = -1
    expect(post).to_not be_valid
  end
  it 'is not valid with nil value for comments counter' do
    post.comment_counter = nil
    expect(post).to_not be_valid
  end

  it 'is valid  with only integer values for comments counter' do
    post.comment_counter = 1.5
    expect(post).to_not be_valid
  end
  it 'is not valid with a negative value for comments counter' do
    post.likes_counter = -1
    expect(post).to_not be_valid
  end
  it 'is not valid with nil value for comments counter' do
    post.likes_counter = nil
    expect(post).to_not be_valid
  end

  it 'is valid  with only integer values for comments counter' do
    post.likes_counter = 1.5
    expect(post).to_not be_valid
  end

  #   test methods of post model
  it 'test posts counter for a given user' do
    @post = post
    @post.update_posts_counter
    @user = User.find_by(id: @post.user_id)
    expect(@user.posts_counter).to eq(1)
  end

  it 'get all comments for a given post' do
    expect(post.comments.length).to eq(10)
  end
  it 'loads only the last 5 comments for a given post' do
    expect(post.recent_comments.length).to eq(5)
  end
  it 'Make sure it  loads only the last 5 commetns for a given post' do
    expect(post.recent_comments.length).to_not eq(6)
  end
end
