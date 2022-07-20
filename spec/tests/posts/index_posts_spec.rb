require 'rails_helper'

RSpec.describe 'User posts', type: :feature do
  before(:all) do
    @user_one = User.create(name: 'Ahmed1', photo: 'https://unsplash.com/photos/WS-1',
                            bio: 'I am not done yet this is user 1', posts_counter: 3)
    @user_two = User.create(name: 'Ahmed2', photo: 'https://unsplash.com/photos/WS-2',
                            bio: 'I am not done yet this is user 2')
    @user_three = User.create(name: 'Ahmed3', photo: 'https://unsplash.com/photos/WS-3',
                              bio: 'I am not done yet this is user 3')

    @post_one = Post.create(user_id: @user_one.id, title: 'Hello post 1', text: 'This is my 1 post', likes_counter: 1,
                            comment_counter: 1)
    @post_two = Post.create(user_id: @user_one.id, title: 'Hello post 2', text: 'This is my 2 post', likes_counter: 2,
                            comment_counter: 2)
    @post_three = Post.create(user_id: @user_one.id, title: 'Hello post 3', text: 'This is my 3 post', likes_counter: 3,
                              comment_counter: 3)

    @comment_1_post_one = Comment.create(post_id: @post_one.id, user_id: @user_two.id,
                                         text: 'Hi Ahmed this is Ahmed 2')
    @comment_2_post_one = Comment.create(post_id: @post_one.id, user_id: @user_three.id,
                                         text: 'Hi Ahmed this is Ahmed 3')
    @comment_1_post_two = Comment.create(post_id: @post_two.id, user_id: @user_two.id,
                                         text: 'Hi Ahmed this is Ahmed 2')
    @comment_2_post_two = Comment.create(post_id: @post_two.id, user_id: @user_three.id,
                                         text: 'Hi Ahmed this is Ahmed 3')
    @comment_1_post_three = Comment.create(post_id: @post_three.id, user_id: @user_two.id,
                                           text: 'Hi Ahmed this is Ahmed 2')
    @comment_2_post_three = Comment.create(post_id: @post_three.id, user_id: @user_three.id,
                                           text: 'Hi Ahmed this is Ahmed 3')
  end
  scenario 'user posts page', js: true do
    visit users_path
    click_link @user_one.name
    expect(current_path).to eql(user_path(@user_one.id))
    click_link 'See User Posts'
    expect(current_path).to eql(user_posts_path(@user_one.id))
    # user posts path
    expect(page).to have_content(@user_one.photo)
    expect(page).to have_content(@user_one.name)
    expect(page).to have_content(@user_one.posts_counter.to_s)
    # posts info
    expect(page).to have_content(@post_one.title)
    expect(page).to have_content(@post_two.title)
    expect(page).to have_content(@post_three.title)
    expect(page).to have_content(@post_one.text)
    expect(page).to have_content(@post_two.text)
    expect(page).to have_content(@post_three.text)
    expect(page).to have_content(@comment_1_post_one.text)
    expect(page).to have_content(@comment_1_post_two.text)
    expect(page).to have_content(@comment_1_post_three.text)
    expect(page).to have_content(@post_one.likes_counter.to_s)
    expect(page).to have_content(@post_two.likes_counter.to_s)
    expect(page).to have_content(@post_three.likes_counter.to_s)
    expect(page).to have_content(@post_one.comment_counter.to_s)
    expect(page).to have_content(@post_two.comment_counter.to_s)
    expect(page).to have_content(@post_three.comment_counter.to_s)
  end
  scenario 'senario 2 of user posts page', js: true do
    visit users_path
    click_link @user_one.name
    expect(current_path).to eql(user_path(@user_one.id))
    click_link 'See User Posts'
    expect(current_path).to eql(user_posts_path(@user_one.id))

    click_link @post_one.title
    expect(current_path).to eql(user_post_path(@user_one.id, @post_one.id))
    # post 2 test
    visit users_path
    click_link @user_one.name
    click_link 'See User Posts'
    click_link @post_two.title
    expect(current_path).to eql(user_post_path(@user_one.id, @post_two.id))
    # post 3 test
    visit users_path
    click_link @user_one.name
    click_link 'See User Posts'
    click_link @post_three.title
    expect(current_path).to eql(user_post_path(@user_one.id, @post_three.id))
  end
end
