class ConnectionsController < ApplicationController
    def index
        @connections = Connection.all
    end
    def show
        id = params[:id] # retrieve movie ID from URI route
        location = params[:location]
        @location = location
        
        @tags = Tag.all
        @locations = Location.all
    end
    
    def new
        id = params[:id] # retrieve movie ID from URI route
        location_id = params[:location]
        @location_id = location_id
        
        @locationInfo = Location.where(id: location_id)
        
        @connection = Connection.new
    # default: render 'new' template
    end 

    def connection_params
        params.require(:connection).permit(:parent_location_name, :child_location_name)
    end

    def create
        params.require(:connection)
        params[:connection].permit(:parent_location_id,:child_location_id)
        # shortcut: params.require(:movie).permit(:title,:rating,:release_date)
        # rest of code...
        @connection = Connection.create!(connection_params)
        flash[:notice] = "Connection was successfully created."
        redirect_to locations_path
    end
    
    def edit
        id = params[:id] # retrieve movie ID from URI route
        location = params[:location]
        @location = location
        @connection = Connection.find params[:id]
    end

    def update
        id = params[:id] # retrieve movie ID from URI route
        location = params[:location]
        @location = location
        @connection = Connection.find params[:id]
        @connection.update_attributes!(connection_params)
        flash[:notice] = "Connection was successfully updated."
        redirect_to connection_path(@connection)
    end
    
    def destroy
        @connection = Connection.find(params[:id])
        @connection.destroy
        flash[:notice] = "Connection deleted."
        redirect_to connection_path
    end
end