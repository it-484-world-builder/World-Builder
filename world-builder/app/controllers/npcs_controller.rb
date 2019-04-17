class NpcsController < ApplicationController
    def index
        @npcs = Npc.all
    end
    def show
        id = params[:id] # retrieve movie ID from URI route
        @npc = Npc.find(id) # look up movie by unique ID
        # will render app/views/movies/show.html.haml by default
    end
    
    def new
        @npc = Npc.new
    # default: render 'new' template
    end 

    def npc_params
        params.require(:npc).permit(:name,:description,:gm_note,:character_note)
    end

    def create
        @npc = Npc.create!(npc_params)
        flash[:notice] = "#{@npc.name} was successfully created."
        redirect_to npcs_path
    end
    
    def edit
        @npc = Npc.find params[:id]
    end

    def update
        @npc = Npc.find params[:id]
        @npc.update_attributes!(npc_params)
        flash[:notice] = "#{@npc.name} was successfully updated."
        redirect_to npc_path(@npc)
    end
    
    def destroy
        @npc = Npc.find(params[:id])
        @npc.destroy
        flash[:notice] = "NPC '#{@npc.name}' deleted."
        redirect_to npcs_path
    end
end