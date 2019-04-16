class Location < ActiveRecord::Base
    belongs_to :world
    belongs_to :tag
    has_many :npcs
    has_many :parent_locations, :class_name => 'Connection'
    has_many :child_locations, :class_name => 'Connection'
end