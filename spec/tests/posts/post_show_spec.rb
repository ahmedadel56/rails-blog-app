require 'rails_helper'

RSpec.describe 'User posts', type: :feature do
  scenario 'Post show page', js: true do
    @user = User.create(name: 'Ahmed', photo: 'https://unsplash.com/photos/WS-zNNx9Pvc', bio: 'I am not done yet')
    @user_two = User.create(name: 'Ahmed2', photo: 'https://unsplash.com/photos/WS-2',
                            bio: 'I am not done yet this is user 2')
    @user_three = User.create(name: 'Ahmed3', photo: 'https://unsplash.com/photos/WS-3',
                              bio: 'I am not done yet this is user 3')
    count = 1
    5.times do |_post|
      Post.create(user_id: @user.id, title: "Hello#{count}", text: "This is my #{count} post")
      count += 1
    end
    @post_one = @user.posts[0]

    @comment_1_post_one = Comment.create(post_id: @post_one.id, user_id: @user_two.id,
                                         text: 'Hi Ahmed this is Ahmed 2')
    @comment_2_post_one = Comment.create(post_id: @post_one.id, user_id: @user_three.id,
                                         text: 'Hi Ahmed this is Ahmed 3')
    visit users_path
    click_link @user.name
    click_link @post_one.title
    expect(current_path).to eql(user_post_path(@user.id, @post_one.id))
    expect(page).to have_content(@post_one.title)
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@post_one.comment_counter.to_s)
    expect(page).to have_content(@post_one.likes_counter.to_s)
    expect(page).to have_content(@post_one.text)
    expect(page).to have_content(@comment_1_post_one.text)
    expect(page).to have_content(@comment_2_post_one.text)
    expect(page).to have_content(@comment_1_post_one.user.name)
    expect(page).to have_content(@comment_2_post_one.user.name)
  end
end
