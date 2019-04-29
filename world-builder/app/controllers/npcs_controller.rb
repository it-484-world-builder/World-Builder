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
        params.require(:npc).permit(:name,:description,:gm_note,:player_note,:image_file_name)
    end
    
    def default_image_file_name
        "world-builder-npc-default.jpg"
    end
    
    def default_image_file_path
        "/system/npcs/images/"
    end
    
    # def save_image
    #     if npc_params[:image_file_name] != ""
    #         dirname = "public" + default_image_file_path
    #         f = File.open(File.join(Dir.pwd, dirname, npc_params[:image_file_name]),"wb") do |file|
    #             file.write(Paperclip.io_adapters.for(npc_params[:image_file_name]).read)
    #         end
    #         ##fill the content
    #         f.close
    #     end
    # end
    
    def create_npc_image_directory
        if @npc.image_file_name != ""
            require 'fileutils'
            dirname = "public" + default_image_file_path + @npc.id.to_s
            FileUtils.mkdir_p(dirname) unless Dir.exists?(dirname)
            update_image_file_path_if_default
            f = File.open(File.join(Dir.pwd, dirname, @npc.image_file_name),"w+")
            ##fill the content
            f.close
        end
    end
    
    def update_image_file_name_to_default_if_empty
        if @npc.image_file_name == ""
            @npc.image_file_name = default_image_file_name
            @npc.save
        end
    end
    
    def update_image_file_path_if_default
        if @npc.image_file_path == default_image_file_path
            @npc.image_file_path = default_image_file_path + @npc.id.to_s + "/"
            @npc.save
        end
    end
    
    def reassign_image_file_name original_file_name
        @npc.image_file_name = original_file_name
        @npc.save
    end
    
    def delete_npc_image_directory
        if @npc.image_file_path != default_image_file_path
            dirname = "public" + @npc.image_file_path
            FileUtils.remove_dir(dirname)
        end
    end

    def create
        @npc = Npc.create!(npc_params)
        create_npc_image_directory
        update_image_file_name_to_default_if_empty
        flash[:notice] = "#{@npc.name} was successfully created."
        redirect_to npcs_path
    end
    
    def edit
        @npc = Npc.find params[:id]
    end

    def update
        @npc = Npc.find params[:id]
        original_file_name = @npc.image_file_name
        @npc.update_attributes!(npc_params)
        if @npc.image_file_name == ""
            reassign_image_file_name(original_file_name)
        end
        create_npc_image_directory
        flash[:notice] = "#{@npc.name} was successfully updated."
        redirect_to npc_path(@npc)
    end
    
    def destroy
        @npc = Npc.find(params[:id])
        @npc.destroy
        delete_npc_image_directory
        flash[:notice] = "NPC '#{@npc.name}' deleted."
        redirect_to npcs_path
    end
end