require "rails_helper"

RSpec.describe MashUpsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mash_ups").to route_to("mash_ups#index")
    end

    it "routes to #new" do
      expect(:get => "/mash_ups/new").to route_to("mash_ups#new")
    end

    it "routes to #show" do
      expect(:get => "/mash_ups/1").to route_to("mash_ups#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/mash_ups/1/edit").to route_to("mash_ups#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/mash_ups").to route_to("mash_ups#create")
    end

    it "routes to #update" do
      expect(:put => "/mash_ups/1").to route_to("mash_ups#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mash_ups/1").to route_to("mash_ups#destroy", :id => "1")
    end

  end
end
