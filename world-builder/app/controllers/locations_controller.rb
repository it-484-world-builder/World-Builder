class LocationsController < ApplicationController
    def index
        @locations = Location.all
    end
    def show
        @tags = Tag.all
        @countries = Location.where(tag_id: 2)
        @connections = Connection.all
        @regions = Location.where(tag_id: 3)
        @cities = Location.where(tag_id: 4)
        @buildings = Location.where(tag_id: 5)
        
        @hcountries = Location.where(tag_id: 2, hidden:false)
        @hregions = Location.where(tag_id: 3, hidden:false)
        @hcities = Location.where(tag_id: 4, hidden:false)
        @hbuildings = Location.where(tag_id: 5, hidden:false)
        
        id = params[:id] # retrieve movie ID from URI route
        @location = Location.find(id) # look up movie by unique ID
        # will render app/views/movies/show.html.haml by default
        gm = params[:gm]
        @gm = gm
    end
    
    def new
        @location = Location.new
    # default: render 'new' template
    end 

    def location_params
        params.require(:location).permit(:name,:description,:world_name,:tag_id,:gm_note,:character_note,:hidden)
    end

    def create
        params.require(:location)
        params[:location].permit(:name,:description,:world_id,:tag_id)
        # shortcut: params.require(:movie).permit(:title,:rating,:release_date)
        # rest of code...
        @location = Location.create!(location_params)
        flash[:notice] = "#{@location.name} was successfully created."
        redirect_to locations_path
    end
    
    def edit
        @location = Location.find params[:id]
    end

    def update
        @location = Location.find params[:id]
        @location.update_attributes!(location_params)
        flash[:notice] = "#{@location.name} was successfully updated."
        redirect_to location_path(@location)
    end
    
    def destroy
        @location = Location.find(params[:id])
        @location.destroy
        flash[:notice] = "Location '#{@location.name}' deleted."
        redirect_to location_path
    end
end