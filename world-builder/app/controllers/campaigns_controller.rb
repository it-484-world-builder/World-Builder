class CampaignsController < ApplicationController
   #before_action :correct_user, only: [:edit, :update, :destroy]
   before_action :authenticate_user!
   
    def index
        @campaigns = Campaign.all
        @user_campaigns = UserCampaign.all
        
        #@userCampaigns = Campaign.where("user_id = User.current_user.id")
    end
    def show
        @users = User.all
        @locations = Location.all
        @continents = Location.where(tag_id: 1)
        @hcontinents = Location.where(tag_id: 1, hidden:false)
        @user_campaigns = UserCampaign.all
        id = params[:id] # retrieve movie ID from URI route
        @campaign = Campaign.find(id) # look up movie by unique ID
        # will render app/views/movies/show.html.haml by default
    end
    
    def new
        @campaign = Campaign.new
    # default: render 'new' template
    end 

    def campaign_params
        params.require(:campaign).permit(:name, :world_name, :user_name)
    end

    def create
        params.require(:campaign)
        params[:campaign].permit(:name, :world_id, :user_name)
        # shortcut: params.require(:movie).permit(:title,:rating,:release_date)
        # rest of code...
        #world = World.find_or_create_by(name: params[:campaign][:world_id])
        @campaign = Campaign.create!(campaign_params)
        flash[:notice] = "#{@campaign.name} was successfully created."
        redirect_to campaigns_path
    end
    
    def edit
        @campaign = Campaign.find params[:id]
    end

    def update
        @campaign = Campaign.find params[:id]
        @campaign.update_attributes!(campaign_params)
        flash[:notice] = "#{@campaign.name} was successfully updated."
        redirect_to campaign_path(@campaign)
    end
    
    def destroy
        @campaign = Campaign.find(params[:id])
        @campaign.destroy
        flash[:notice] = "Campaign '#{@campaign.name}' deleted."
        redirect_to campaign_path
    end
    
    # define the current and correct user 
    def correct_user
        #@mycampaign = current_user.campaigns.find_by(id: params[:id])
        #redirect_to campaigns_path, notice: "Not Authorized to edit this Campaign" if @campaign.nil?
    end
end