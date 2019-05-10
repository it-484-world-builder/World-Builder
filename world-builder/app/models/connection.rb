class Connection < ActiveRecord::Base
    belongs_to :parent_location, :class_name => 'Location'
    belongs_to :child_location, :class_name => 'Location'
    
    def parent_location_name=(name)
        self.parent_location = Location.find_or_create_by(name: name)
    end

    def parent_location_name
        self.parent_location ? self.parent_location.name : nil
    end
    
    def child_location_name=(name)
        self.child_location = Location.find_or_create_by(name: name)
    end

    def child_location_name
        self.child_location ? self.child_location.name : nil
    end
    
    

end