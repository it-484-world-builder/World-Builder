class Campaign < ActiveRecord::Base
    belongs_to :user
    belongs_to :world
    has_many :character_campaigns
end