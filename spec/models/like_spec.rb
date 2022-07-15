require 'rails_helper'
RSpec.describe Post, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  post = Post.create(user_id: user.id, title: 'Hello', text: 'This is my first post')
  like = Like.create(post_id: post.id, user_id: user.id)

  it 'test commnets counter for a given post' do
    @like = like
    @user = user
    @like.update_likes_counter
    @post = Post.find_by(id: @like.post_id, user_id: @user.id)
    expect(@post.likes_counter).to eq(1)
  end
end
