# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
(1..3).each do |i|
  name = Faker::Name.name
  email = "example#{i}@railstutorial.org"
  password = "password"
  provider = "provider#{i}"
  uid      = "123456#{i}"

  User.create!(name: name,
              email: email,
              password: password,
              provider: provider,
              uid:      uid
              )
  Blog.create!(user_id: "#{i}")
end
