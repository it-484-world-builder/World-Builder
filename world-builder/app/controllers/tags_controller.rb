class TagsController < ApplicationController
    def index
        @tags = Tag.all
    end
    def show
        id = params[:id] # retrieve movie ID from URI route
        @tag = Tag.find(id) # look up movie by unique ID
        # will render app/views/movies/show.html.haml by default
    end
    
    def new
        @tag = Tag.new
    # default: render 'new' template
    end 

    def tag_params
        params.require(:tag).permit(:name)
    end

    def create
        params.require(:tag)
        params[:tag].permit(:name,:rank)
        # shortcut: params.require(:movie).permit(:title,:rating,:release_date)
        # rest of code...
        @tag = Tag.create!(tag_params)
        flash[:notice] = "#{@tag.name} was successfully created."
        redirect_to tags_path
    end
    
    def edit
        @tag = Tag.find params[:id]
    end

    def update
        @tag = Tag.find params[:id]
        @tag.update_attributes!(tag_params)
        flash[:notice] = "#{@tag.name} was successfully updated."
        redirect_to tag_path(@tag)
    end
    
    def destroy
        @tag = Tag.find(params[:id])
        @tag.destroy
        flash[:notice] = "Tag '#{@tag.name}' deleted."
        redirect_to tag_path
    end
end