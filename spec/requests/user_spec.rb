require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET User /index, show' do
    user = User.create(name: 'Ahmed', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')

    it 'List All of users and check  status code of request ' do
      get users_path
      expect(assigns(:users)).to eq(User.all)
      expect(response).to render_template(:index)
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
