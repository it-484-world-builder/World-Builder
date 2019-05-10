class NpcsController < ApplicationController
    def index
        @npcs = Npc.all
    end
    def show
        id = params[:id] # retrieve movie ID from URI route
        @npc = Npc.find(id) # look up movie by unique ID
        # will render app/views/movies/show.html.haml by default
        @location = Location.find(@npc.location_id)
        @gm = params[:gm]
        @campaign_id = params[:campaign_id]
    end
    
    def new
        @npc = Npc.new
        @location_id = params[:location_id]
        @location  = Location.find(@location_id)
        @gm = params[:gm]
        @campaign_id = params[:campaign_id]
    # default: render 'new' template
    end 

    def npc_params
        params.require(:npc).permit(:name,:description,:gm_note,:player_note,:gm,:campaign_id,:location_id)
    end

    def create
        @npc = Npc.create!(npc_params)
        @location = Location.find(@npc.location_id)
        @gm = params[:gm]
        @campaign_id = params[:campaign_id]
        flash[:notice] = "#{@npc.name} was successfully created."
        redirect_to npc_path(@npc, gm: @gm, campaign_id: @campaign_id)
        # redirect_to npcs_path
    end
    
    def edit
        @npc = Npc.find params[:id]
        @gm = params[:gm]
        @campaign_id = params[:campaign_id]
    end

    def update
        @npc = Npc.find params[:id]
        @gm = params[:gm]
        @campaign_id = params[:campaign_id]
        @npc.update_attributes!(npc_params)
        flash[:notice] = "#{@npc.name} was successfully updated."
        redirect_to npc_path(@npc, gm: @gm, campaign_id: @campaign_id)
    end
    
    def destroy
        @npc = Npc.find(params[:id])
        @location_id = @npc.location_id
        @gm = params[:gm]
        @campaign_id = params[:campaign_id]
        @npc.destroy
        flash[:notice] = "NPC '#{@npc.name}' deleted."
        redirect_to location_path(@location_id, gm: @gm, campaign_id: @campaign_id)
    end
end