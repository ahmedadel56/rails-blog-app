require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Model Validations' do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')

    5.times do |i|
      Post.create(title: "Post #{i}", text: "text#{i}", user_id: user.id)
    end
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user.name = nil
      expect(user).to_not be_valid
    end
    it 'is not valid with a negative value for posts counter' do
      user.posts_counter = -1
      expect(user).to_not be_valid
    end
    it 'is not valid with nil value for posts counter' do
      user.posts_counter = nil
      expect(user).to_not be_valid
    end

    it 'is valid  with only integer values for posts counter' do
      user.posts_counter = 1.5
      expect(user).to_not be_valid
    end

    # test user model method

    it 'get all posts for a given user' do
      expect(user.posts.length).to eq(5)
    end
    it 'loads only the last three posts for a given user' do
      expect(user.last_three_posts.length).to eq(3)
    end
    it 'Make sure it  loads only the last three posts for a given user' do
      expect(user.last_three_posts.length).to_not eq(5)
    end
  end
end
