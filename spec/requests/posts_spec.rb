require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET Posts  /index, /show' do
    user = User.create(name: 'Ahmed', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    post = Post.create(user_id: user.id, title: 'Hello', text: 'This is my first post')
    10.times do |_i|
      Comment.create(post_id: post.id, user_id: user.id, text: 'Hi Tom!')
    end

    it 'List All of posts for aspacefic user and check  status code of request ' do
      @user = user
      @post = post
      get user_posts_path(@user.id)
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Names of all the people')
    end
    it 'Show Post details' do
      @user = user
      @post = post
      get "/users/#{@user.id}/posts/#{@post.id}"
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Show spacefic post')
    end
  end
end
