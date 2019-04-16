# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
<<<<<<< HEAD
more_worlds = [
    {:name => 'World 1', :description => 'cool world full of fun stuff'},
    {:name => 'World 2', :description => 'cooler world full of even more fun stuff'},
    {:name => 'World 3', :description => 'coolest world full of the most fun stuff'},
    {:name =>'Grey Hawk',  :description =>'World where hawks are only grey', :gm_note =>'There is one red hawk in the world', :character_note =>'The sky is no longer blue, it is cyan'}
    ]
    
more_worlds.each do |worlds|
    World.create!(world)
end

more_campaigns = [
    {:name =>'Curse of Strahd',  :user =>'Dan', :world => 'Grey Hawk'},
    {:name => 'Jonny\'s Campaign', :world_id => 1, :user_id => 1},
    {:name => 'Eric\'s Campaign', :world_id => 2, :user_id => 2},
    {:name => 'Anthony\'s Campaign', :world_id => 1, :user_id => 3},
    {:name => 'Leo\'s Campaign', :world_id => 1, :user_id => 4},
    {:name => 'Mustafe\'s Campaign', :world_id => 2, :user_id => 5}

    ]

more_campaigns.each do |campaigns|
    Campaign.create!(campaign)
end

more_users = [
    {:name => 'Jonny'},
    {:name => 'Eric'},
    {:name => 'Anthony'},
    {:name => 'Leo'},
    {:name => 'Mustafe'},
    { :name => 'Bob'},
    { :name => 'Susan'},
    { :name => 'Dan'}

    ]
    
more_users.each do |users|
    User.create!(user)    
end

more_characters = [
    { :name => 'Aaragon', :user =>'Susan' },
    { :name => 'Puff', :user =>'Dan'  }
]

more_characters.each do |characters|
    Character.create!(character)
end

more_character_campaigns = [
    {:character =>'Aaragon', :campaign =>'Curse of Strahd'},
    {:character =>'Puff', :campaign =>'Curse of Strahd'}

]

more_character_campaigns.each do |character_campaigns|
    Character_campaign.create!(character_campaign)
end
    
more_tags = [
    {:name =>'Contient', :rank =>1},
    {:name =>'Country', :rank =>2},
    {:name =>'Region', :rank =>3},
    {:name =>'City', :rank =>4},
    {:name =>'Building', :rank =>5}
    ]
    
more_tags.each do |tags|
    Tag.create!(tag)
end

more_locations = [
    { :name =>'Hidden Contient', :description => 'The location of this place is unknown', :gm_note => 'Was once a part of the contient, but disapeared when cursed', :player_note => 'Location is not know', :world => 'Grey Hawk' , :tag => 1},
    { :name =>'Hidden Country', :description => 'The location of this place is unknown', :gm_note => 'Was once a part of the contient, but disapeared when cursed', :player_note => 'Location is not know', :world => 'Grey Hawk' , :tag => 2},
    { :name =>'Barovia', :description => 'The land is surrounded by mist', :gm_note => 'This land is cursed because of Strhad ', :player_note => 'Place is scary', :world => 'Grey Hawk' , :tag => 3},
    { :name =>'Village of Barovia', :description => 'Small village of people', :gm_note => 'People are always gloomy and there is a haunted house', :player_note => 'Place is gloomy feeling', :world => 'Grey Hawk' , :tag => 4},
    { :name =>'Blood of the Vine Tavern', :description => 'Blood of the Vine Tavern a sign outside claims to be this location', :gm_note => 'three people work here', :player_note => 'There is a fire place inside', :world => 'Grey Hawk' , :tag => 5}
    ]
 
 more_locations.each do |locations|
     Locations.create!(location)
 end
 
 more_npcs = [
     { :name => 'Ismark Kolyanovich', :description => 'Young man blonde grey hair and dark robes', :gm_note => 'called ismark the lesser because he lives in the shadow of his father', :player_note =>'Friendlier than most people in the village', :location =>' Blood of the Vine Tavern'}
     ]
     
more_npcs.each do |npcs|
    Npc.create!(npc)
end

more_connections = [
    { :parent_location => 'Hidden Contient' , :child_location => 'Hidden Country'},
    { :parent_location => 'Hidden Country' , :child_location => 'Barovia'},
    { :parent_location => 'Barovia' , :child_location => 'Village of Barovia'},
    { :parent_location => 'Village of Barovia' , :child_location => 'Blood of the Vine Tavern'}	
    ]
    
more_connections.each do |connections|
    Connection.create (connection)
end
=======


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
  {:name => 'World 3', :description => 'coolest world full of the most fun stuff'},
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
>>>>>>> 0c1183690009a08c0559180a20a7fb818c86f1f4
