class CharacterCampaign < ActiveRecord::Base
    belongs_to :character
    belongs_to :campaign
end