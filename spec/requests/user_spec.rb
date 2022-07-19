require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET User /index, show' do
    user = User.create(name: 'Ahmed', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')

    it 'List All of users and check  status code of request ' do
      get users_path
      expect(assigns(:users)).to eq(User.all)
      expect(response).to render_template(:index)
      # user 1
      expect(response.body).to include(user.photo)
      expect(response.body).to include(user.name)
      expect(response.body).to include(user.posts_counter.to_s)
      expect(response).to have_http_status(:ok)
    end
    it 'Show Info of spacefic user' do
      @user = user
      get user_path(@user.id)
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Here is the Profile for a given user')
    end
  end
end

RSpec.describe 'Users', type: :feature do
  scenario 'users index page' do
    user = User.create(name: 'medhat', photo: 'medhat.com', bio: 'I am done here')
    visit user_path(user.id)
    expect(page).to have_content('I am done here')
  end

  scenario 'user profile page' do
    user = User.create(name: 'medhat', photo: 'medhat.com', bio: 'I am done here')
    10.times do |_i|
      Post.create(id: user, title: 'hello', text: 'this is the text', comment_counter: 6, likes_counter: 5)
    end
    visit user_path(user.id)
    expect(page).to have_content(user.bio)
    expect(page).to have_content(user.photo)
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.posts_counter.to_s)
  end
end
