class Npc < ActiveRecord::Base
    belongs_to :location
    
    # setters and getters for location foreign key
    def location_name=(name)
        self.location = Location.find_or_create_by(name: name)
    end

    def location_name
        self.location ? self.location.name : nil
    end

end