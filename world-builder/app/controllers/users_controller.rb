class UsersController < ApplicationController
    def index
        @users = User.all
    end
    def show
        id = params[:id] # retrieve movie ID from URI route
        @user = User.find(id) # look up movie by unique ID
        # will render app/views/movies/show.html.haml by default
    end
    
    def new
        @user = User.new
    # default: render 'new' template
    end 

    def user_params
        params.require(:user).permit(:name)
    end

    def create
        params.require(:user)
        params[:user].permit(:name)
        # shortcut: params.require(:movie).permit(:title,:rating,:release_date)
        # rest of code...
        @user = User.create!(user_params)
        flash[:notice] = "#{@user.name} was successfully created."
        redirect_to users_path
    end
    
    def edit
        @user = User.find params[:id]
    end

    def update
        @user = User.find params[:id]
        @user.update_attributes!(user_params)
        flash[:notice] = "#{@user.name} was successfully updated."
        redirect_to user_path(@user)
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:notice] = "User '#{@user.name}' deleted."
        redirect_to user_path
    end
end