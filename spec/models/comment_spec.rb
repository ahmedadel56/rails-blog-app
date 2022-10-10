require 'rails_helper'
RSpec.describe Post, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  post = Post.create(user_id: user.id, title: 'Hello', text: 'This is my first post')
  comment = Comment.create(post_id: post.id, user_id: user.id, text: 'Hi Tom! this is comment test')

  it 'test commnets counter for a given post' do
    @comment = comment
    @user = user
    @comment.update_comments_counter
    @post = Post.find_by(id: @comment.post_id, user_id: @user.id)
    expect(@post.comment_counter).to eq(1)
  end
end
