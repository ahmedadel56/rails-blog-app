require 'rails_helper'

RSpec.describe 'User', type: :feature do
  scenario 'user profile page', js: true do
    user = User.create(name: 'Ahmed', photo: 'medhat.com', bio: 'I am not done yet')
    count = 1
    5.times do |_post|
      Post.create(user_id: user.id, title: "Hello #{count}", text: "This is my #{count} post")
      count += 1
    end
    visit users_path
    click_link user.name
    expect(current_path).to eql(user_path(user.id))
    expect(page).to have_content(user.bio)
    expect(page).to have_content(user.photo)
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.posts_counter.to_s)
    expect(page).to have_content(user.posts[0].text)
    expect(page).to have_content(user.posts[1].text)
    expect(page).to have_content(user.posts[2].text)
    expect(page).to_not have_content(user.posts[3].text)
    expect(page).to_not have_content(user.posts[4].text)
  end
end
