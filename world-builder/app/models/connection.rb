class Connection < ActiveRecord::Base
    belongs_to :parent_location, :class_name => 'Location'
    belongs_to :child_location, :class_name => 'Location'
end