class Campaign < ActiveRecord::Base
    belongs_to :user
    belongs_to :world
    has_many :character_campaigns
    
    # setters and getters for world foreign key
    def world_name=(name)
        self.world = World.find_or_create_by(name: name)
    end

    def world_name
        self.world ? self.world.name : nil
    end
    
    # setters and getters for user foreign key
    def user_name=(name)
        self.user = User.find_or_create_by(name: name)
    end

    def user_name
        self.user ? self.user.name : nil
    end
end