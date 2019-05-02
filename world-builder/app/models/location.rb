class Location < ActiveRecord::Base
    belongs_to :world
    belongs_to :tag
    has_many :npcs
    has_many :parent_locations, :class_name => 'Connection'
    has_many :child_locations, :class_name => 'Connection'
    
        # setters and getters for tag foreign key
    def tag_name=(name)
        self.tag = Tag.find_or_create_by(name: name)
    end

    def tag_name
        self.tag ? self.tag.name : nil
    end
    
        # setters and getters for world foreign key
    def world_name=(name)
        self.world = World.find_or_create_by(name: name)
    end

    def world_name
        self.world ? self.world.name : nil
    end

end