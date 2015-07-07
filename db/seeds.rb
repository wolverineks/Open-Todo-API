# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

user = User.new(
  username: "Reipun",
  password: "helloworld"
  )
user.save!

user = User.new(
  username: "Kebin",
  password: "helloworld"
  )
user.save!

user = User.new(
  username: "username",
  password: "password"
  )
user.save!

5.times do 
  list = List.new(
    name:        Faker::Lorem.characters(7),
    permissions: ["private", "viewable", "open"].sample,
    user:        User.all.sample
  )
  list.save!
end

35.times do 
  item = Item.new(
    description: Faker::Lorem.sentence,
    list:        List.all.sample
  )
  item.save!
end