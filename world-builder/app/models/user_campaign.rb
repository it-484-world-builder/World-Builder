class UserCampaign < ActiveRecord::Base
    belongs_to :user
    belongs_to :campaign
    
    def user_name=(name)
        self.user = User.find_or_create_by(name: name)
    end

    def user_name
        self.user ? self.user.name : nil
    end
    
    def campaign_name=(name)
        self.campaign = Campaign.find_or_create_by(name: name)
    end

    def campaign_name
        self.campaign ? self.campaign.name : nil
    end
    
end