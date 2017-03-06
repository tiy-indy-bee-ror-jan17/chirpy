# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

25.times do

  username = Faker::Internet.user_name

  user = User.create!(
    username: username,
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password,
    bio: Faker::Hipster.paragraph,
    avatar: "https://robohash.org/#{username}.png",
    created_at: rand(1..25).days.ago
  )

  15.times do
    user.posts.create!(
      body: Faker::TwinPeaks.quote
    )
  end

end

users = User.all

users.each do |user|
  rand(1..15).times do
    to_follow = users.sample
    user.follow!(to_follow) unless user == to_follow
  end
end
