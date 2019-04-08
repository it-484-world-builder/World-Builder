class World < ActiveRecord::Base
    has_many :campaigns
    has_many :locations
end