require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  scenario 'users index page' do
    user1 = User.create(name: 'medhat', photo: 'medhat.com', bio: 'I am done here')
    user2 = User.create(name: 'Ahmed', photo: 'medhat.com', bio: 'I am not done yet')
    visit users_path
    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)
    expect(page).to have_content(user1.photo)
    expect(page).to have_content(user2.photo)
    expect(page).to have_content(user1.posts_counter.to_s)
    expect(page).to have_content(user2.posts_counter.to_s)
    click_link user1.name
    expect(current_path).to eql(user_path(user1.id))
    sleep 1
    visit users_path
    sleep 1
    click_link user2.name
    sleep 1
    expect(current_path).to eql(user_path(user2.id))
  end
end
