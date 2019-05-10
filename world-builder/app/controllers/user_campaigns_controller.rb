class UserCampaignsController < ApplicationController
    def form_params
        params.require(:week_selection).permit(days:[])
    end
    
    def index
        @user_campaigns = UserCampaigns.all
    end
    def show
        id = params[:id] # retrieve movie ID from URI route
        
    end
    
    def new
        id = params[:id] # retrieve movie ID from URI route
        
        campaign_id = params[:campaign_id]
        
        @campaign_id = campaign_id
        
        @campaignInfo = Campaign.where(id: campaign_id)
        
        @user_campaign = UserCampaign.new
        
        @users = User.all
    # default: render 'new' template
    end 

    def user_campaign_params
        params.require(:user_campaign).permit(:user_name, :campaign_name)
    end

    def create
        params.require(:user_campaign)
        params[:user_campaign].permit(:user_id,:campaign_id)
        # shortcut: params.require(:movie).permit(:title,:rating,:release_date)
        # rest of code...
        @user_campaign = UserCampaign.create!(user_campaign_params)
        flash[:notice] = "Player was successfully added."
        redirect_to campaigns_path
    end
    
    def edit
        id = params[:id] # retrieve movie ID from URI route
        @user_campaign = UserCampaign.find params[:id]
    end

    def update
        id = params[:id] # retrieve movie ID from URI route
        #location = params[:location]
        #@location = location
        @user_campaign = UserCampaign.find params[:id]
        @user_campaign.update_attributes!(user_campaign_params)
        flash[:notice] = "Connection was successfully updated."
        redirect_to user_campaigns_path(@user_campaign)
    end
    
    def destroy
        @user_campaign= UserCampaign.find(params[:id])
        @user_campaign.destroy
        flash[:notice] = "Player removed."
        redirect_to campaigns_path
    end
end