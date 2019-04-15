class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
  end
  def show
    id = params[:id] # retrieve movie ID from URI route
    @campaign = Campaign.find(id) # look up movie by unique ID
    # will render app/views/movies/show.html.haml by default
  end
end
