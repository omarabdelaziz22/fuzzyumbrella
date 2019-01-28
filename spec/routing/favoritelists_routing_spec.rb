require "rails_helper"

RSpec.describe FavoritelistsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/favoritelists").to route_to("favoritelists#index")
    end

    it "routes to #new" do
      expect(:get => "/favoritelists/new").to route_to("favoritelists#new")
    end

    it "routes to #show" do
      expect(:get => "/favoritelists/1").to route_to("favoritelists#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/favoritelists/1/edit").to route_to("favoritelists#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/favoritelists").to route_to("favoritelists#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/favoritelists/1").to route_to("favoritelists#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/favoritelists/1").to route_to("favoritelists#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/favoritelists/1").to route_to("favoritelists#destroy", :id => "1")
    end
  end
end
