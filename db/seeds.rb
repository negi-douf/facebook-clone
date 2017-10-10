# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 10.times do |n|
#   name = Faker::Name.name
#   email = Faker::Internet.email
#   password = "password"
#   User.create!(
#     name: name,
#     email: email,
#     uid: User.create_unique_string,
#     password: password,
#     password_confirmation: password
#   )
# end

# 10.times do |n|
#   user_id = rand(1..User.last.id)
#   unless User.find_by(id: user_id) == nil
#     topic = Topic.new
#     topic.content = Faker::Pokemon.location
#     topic.user_id = user_id
#     topic.save
#   end
# end

# 30.times do |n|
#   user_id = rand(1..User.last.id)
#   topic_id = rand(1..Topic.last.id)
#   if User.find_by(id: user_id) != nil && Topic.find_by(id: topic_id) != nil
#     comment = Comment.new
#     comment.user_id = user_id
#     comment.topic_id = topic_id
#     comment.content = Faker::Pokemon.name
#     comment.save
#   end
# end
