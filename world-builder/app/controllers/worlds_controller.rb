class WorldsController < ApplicationController
    before_action :authenticate_user!

    def index
        @worlds = World.all
    end
    def show
        id = params[:id] # retrieve movie ID from URI route
        @world = World.find(id) # look up movie by unique ID
        # will render app/views/movies/show.html.haml by default
    end
    
    def new
        @world = World.new
    # default: render 'new' template
    end 

    def world_params
        params.require(:world).permit(:name,:description,:gm_note,:character_note)
    end

    def create
        params.require(:world)
        params[:world].permit(:name,:description,:gm_note,:character_note)
        # shortcut: params.require(:movie).permit(:title,:rating,:release_date)
        # rest of code...
        @world = World.create!(world_params)
        flash[:notice] = "#{@world.name} was successfully created."
        redirect_to worlds_path
    end
    
    def edit
        @world = World.find params[:id]
    end

    def update
        @world = World.find params[:id]
        @world.update_attributes!(world_params)
        flash[:notice] = "#{@world.name} was successfully updated."
        redirect_to world_path(@world)
    end
    
    def destroy
        @world = World.find(params[:id])
        @world.destroy
        flash[:notice] = "World '#{@world.name}' deleted."
        redirect_to world_path
    end
end