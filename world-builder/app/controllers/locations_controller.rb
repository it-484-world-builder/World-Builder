class LocationsController < ApplicationController
    def index
        if params.has_key?(:world) == true
            @wlocations = Location.where(world_id: params[:world].to_i)
            world_id = params[:world]
            @world = World.find(world_id)
            name = @world.name
            @name = name
        end
        
        if params.has_key?(:campaign_id) == true
            campaign_id = params[:campaign_id]
            @campaign = Campaign.find(campaign_id)
            @campaign_id = campaign_id
        end
        
        else
            @locations = Location.all
        
        
    end
    def show
        @tags = Tag.all
        @countries = Location.where(tag_id: 2)
        @connections = Connection.all
        @regions = Location.where(tag_id: 3)
        @cities = Location.where(tag_id: 4)
        @buildings = Location.where(tag_id: 5)
        @worlds = World.all
        @npcs = Npc.all
        @locations = Location.all
        
        
        @hcountries = Location.where(tag_id: 2, hidden:false)
        @hregions = Location.where(tag_id: 3, hidden:false)
        @hcities = Location.where(tag_id: 4, hidden:false)
        @hbuildings = Location.where(tag_id: 5, hidden:false)
        
        id = params[:id] # retrieve movie ID from URI route
        @location = Location.find(id) # look up movie by unique ID
        # will render app/views/movies/show.html.haml by default
        gm = params[:gm]
        @gm = gm
        
        if params.has_key?(:campaign_id) == true
            campaign_id = params[:campaign_id]
            @campaign = Campaign.find(campaign_id)
            @campaign_id = campaign_id
        end
        
        if @location.tag_id > 1
            @connections.where(:child_location_id => @location.id).each do |connection|
                @parent_location_id = connection.parent_location_id
                @parent_location = Location.find(@parent_location_id)
            end
        end
    end
    
    def new
        @location = Location.new
    # default: render 'new' template
    end 

    def location_params
        params.require(:location).permit(:name,:description,:world_name,:tag_name,:gm_note,:character_note,:hidden)
    end

    def create
        params.require(:location)
        params[:location].permit(:name,:description,:world_id,:tag_id,:campaign_id)
        # shortcut: params.require(:movie).permit(:title,:rating,:release_date)
        # rest of code...
        @location = Location.create!(location_params)
        flash[:notice] = "#{@location.name} was successfully created."
        redirect_to locations_path
    end
    
    def edit
        @location = Location.find params[:id]
        @gm = params[:gm]
        @campaign_id = params[:campaign_id]
    end

    def update
        @location = Location.find params[:id]
        @location.update_attributes!(location_params)
        flash[:notice] = "#{@location.name} was successfully updated."
        redirect_to location_path(@location.id, gm: @gm, campaign_id: @campaign_id)
    end
    
    def destroy
        @location = Location.find(params[:id])
        @location.destroy
        flash[:notice] = "Location '#{@location.name}' deleted."
        redirect_to location_path
    end
end