# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# (1..3).each do |i|
#   name = Faker::Name.name
#   email = "example#{i}@railstutorial.org"
#   password = "password"
#   provider = "provider#{i}"
#   uid      = "123456#{i}"
#
#   User.create!(name: name,
#               email: email,
#               password: password,
#               provider: provider,
#               uid:      uid
#               )
#   Blog.create!(user_id: "#{i}")
  # @random = [*1..5].sample
  #
  # a = Manufacture.create! name: 'たろう'
  #   %w(レコード イヤホン マイク webカメラ).each do |name|
  #   a.products.create! name: name, price: @random * 1000, released_on: @random.day.ago
  # end
  #
  # b = Manufacture.create! name: "b工業"
  #   %w(洗濯機 冷蔵庫 エアコン).each do |name|
  #   b.products.create! name: name, price: @random * 10000, released_on: @random.day.ago
  #   end
10.times do |i|
rand_id = 0
until User.find_by_id(rand_id) != nil do
rand_id = rand(1..1000)
end
a = Blog.create( title: "title#{i}", content: "sample text #{i}", user_id: rand_id )
binding.pry
end
