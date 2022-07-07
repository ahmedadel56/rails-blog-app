# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#               *** Uesrs List ***..............
first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-38245t62t5', bio: 'Teacher from Poland.')
third_user = User.create(name: 'Ahmed', photo: 'https://unsplash.com/photos/F_-BAF342BJH', bio: 'Teacher from Egypt.')
fourth_user = User.create(name: 'Mohamed', photo: 'https://unsplash.com/photos/F_-93KG2L25', bio: 'Teacher from US.')
fivth_user = User.create(name: 'Ziad', photo: 'https://unsplash.com/photos/F_-345FDSG', bio: 'Teacher from England.')
six_user = User.create(name: 'Tarek', photo: 'https://unsplash.com/photos/F_-KMWRKMA99AF9', bio: 'Teacher from Canada.')


#.............*** Posts List ***................
post_1 = Post.create(user: first_user, title: 'Hello', text: 'This is my first post')
post_2 = Post.create(user: second_user, title: 'Hello', text: 'This is my first post')
post_3 = Post.create(user: third_user, title: 'Hello', text: 'This is my first post')
post_4 = Post.create(user: fourth_user, title: 'Hello', text: 'This is my first post')
post_5 = Post.create(user: fivth_user, title: 'Hello', text: 'This is my first post')
post_6 = Post.create(user: six_user, title: 'Hello', text: 'This is my first post')
post_7 = Post.create(user: first_user, title: 'Hello', text: 'This is my second post')
post_8 = Post.create(user: second_user, title: 'Hello', text: 'This is my second post')
post_9 = Post.create(user: third_user, title: 'Hello', text: 'This is my second post')
post_10 = Post.create(user: fourth_user, title: 'Hello', text: 'This is my second post')
post_11 = Post.create(user: fivth_user, title: 'Hello', text: 'This is my second post')
post_12 = Post.create(user: six_user, title: 'Hello', text: 'This is my second post')

#.............*** Comments List ***................
Comment.create(post: post_1, user: second_user, text: 'Hi Tom!' )
Comment.create(post: post_1, user: third_user, text: 'Hi Tom!' )
Comment.create(post: post_1, user: fourth_user, text: 'Hi Tom!' )
Comment.create(post: post_1, user: fivth_user, text: 'Hi Tom!' )
Comment.create(post: post_1, user: six_user, text: 'Hi Tom!' )
Comment.create(post: post_2, user: first_user, text: 'Hi Tom!')
Comment.create(post: post_2, user: third_user, text: 'Hi Tom!')
Comment.create(post: post_2, user: fourth_user, text: 'Hi Tom!' )
Comment.create(post: post_2, user: fivth_user, text: 'Hi Tom!' )
Comment.create(post: post_2, user: six_user, text: 'Hi Tom!' )