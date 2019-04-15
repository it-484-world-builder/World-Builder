# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


more_campaigns = [
  {:name => 'Jonny\'s Campaign', :world_id => 1, :user_id => 1},
  {:name => 'Eric\'s Campaign', :world_id => 2, :user_id => 2},
  {:name => 'Anthony\'s Campaign', :world_id => 1, :user_id => 3},
  {:name => 'Leo\'s Campaign', :world_id => 1, :user_id => 4},
  {:name => 'Mustafe\'s Campaign', :world_id => 2, :user_id => 5},
]

more_campaigns.each do |campaign|
  Campaign.create!(campaign)
  end
  
more_worlds = [
  {:name => 'World 1', :description => 'cool world full of fun stuff'},
  {:name => 'World 2', :description => 'cooler world full of even more fun stuff'},
]

more_worlds.each do |world|
  World.create!(world)
  end
  
more_users = [
  {:name => 'Jonny'},
  {:name => 'Eric'},
  {:name => 'Anthony'},
  {:name => 'Leo'},
  {:name => 'Mustafe'},
]

more_users.each do |user|
  User.create!(user)
  end
