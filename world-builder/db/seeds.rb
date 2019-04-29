# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

more_worlds = [
    {:name => 'World 1', :description => 'cool world full of fun stuff'},
    {:name => 'World 2', :description => 'cooler world full of even more fun stuff'},
    {:name => 'World 3', :description => 'coolest world full of the most fun stuff'},
    {:name => 'Grey Hawk', :description =>'World where hawks are only grey', :gm_note =>'There is one red hawk in the world', :character_note =>'The sky is no longer blue, it is cyan'}
    ]
    
more_worlds.each do |world|
    World.create!(world)
    end

more_campaigns = [
    {:name =>'Curse of Strahd',  :user_id => 8, :world_id => 4},
    {:name => 'Jonny\'s Campaign', :world_id => 1, :user_id => 1},
    {:name => 'Eric\'s Campaign', :world_id => 2, :user_id => 2},
    {:name => 'Anthony\'s Campaign', :world_id => 1, :user_id => 3},
    {:name => 'Leo\'s Campaign', :world_id => 1, :user_id => 4},
    {:name => 'Mustafe\'s Campaign', :world_id => 2, :user_id => 5}

    ]

more_campaigns.each do |campaign|
    Campaign.create!(campaign)
    end

more_users = [
    ]
    
more_users.each do |user|
    User.create!(user)    
    end

more_characters = [
    { :name => 'Aaragon', :user_id =>7 },
    { :name => 'Puff', :user_id =>6  }
]

more_characters.each do |character|
    Character.create!(character)
    end

=begin
#commented out due to error will be changed due to database

more_user_campaigns = [
    {:character_id =>'Aaragon', :campaign_id =>'Curse of Strahd'},
    {:character_id=>'Puff', :campaign_id =>'Curse of Strahd'}

]

more_character_campaigns.each do |character_campaign|
    Character_campaign.create!(character_campaign)
end
=end
    
more_tags = [
    {:name =>'Contient', :rank =>1},
    {:name =>'Country', :rank =>2},
    {:name =>'Region', :rank =>3},
    {:name =>'City', :rank =>4},
    {:name =>'Building', :rank =>5}
    ]
    
more_tags.each do |tag|
    Tag.create!(tag)
    end

more_locations = [
    { :name =>'Hidden Contient', :description => 'The location of this place is unknown', :gm_note => 'Was once a part of the contient, but disapeared when cursed', :player_note => 'Location is not know', :world_id => 4 , :tag_id => 1},
    { :name =>'Hidden Country', :description => 'The location of this place is unknown', :gm_note => 'Was once a part of the contient, but disapeared when cursed', :player_note => 'Location is not know', :world_id => 4  , :tag_id => 2},
    { :name =>'Barovia', :description => 'The land is surrounded by mist', :gm_note => 'This land is cursed because of Strhad ', :player_note => 'Place is scary', :world_id => 4 , :tag_id => 3},
    { :name =>'Village of Barovia', :description => 'Small village of people', :gm_note => 'People are always gloomy and there is a haunted house', :player_note => 'Place is gloomy feeling', :world_id => 4  , :tag_id => 4},
    { :name =>'Blood of the Vine Tavern', :description => 'Blood of the Vine Tavern a sign outside claims to be this location', :gm_note => 'three people work here', :player_note => 'There is a fire place inside', :world_id => 4  , :tag_id => 5}
    ]
 
 more_locations.each do |location|
    Location.create!(location)
    end
 
 more_npcs = [
     { :name => 'Ismark Kolyanovich', :description => 'Young man blonde grey hair and dark robes', :gm_note => 'called ismark the lesser because he lives in the shadow of his father', :player_note =>'Friendlier than most people in the village', :location_id =>5},
     { :name => 'Shopkeeper'}
     ]
     
more_npcs.each do |npc|
    Npc.create!(npc)
    end


more_connections = [
    { :parent_location_id => 1 , :child_location_id => 2},
    { :parent_location_id => 2 , :child_location_id => 3},
    { :parent_location_id => 3 , :child_location_id => 4},
    { :parent_location_id => 4 , :child_location_id => 5}	
    ]
    
more_connections.each do |connection|
    Connection.create (connection)
    end
