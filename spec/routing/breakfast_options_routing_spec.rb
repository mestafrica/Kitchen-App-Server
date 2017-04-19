require "rails_helper"

RSpec.describe BreakfastOptionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/breakfast_options").to route_to("breakfast_options#index")
    end

    it "routes to #new" do
      expect(:get => "/breakfast_options/new").to route_to("breakfast_options#new")
    end

    it "routes to #show" do
      expect(:get => "/breakfast_options/1").to route_to("breakfast_options#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/breakfast_options/1/edit").to route_to("breakfast_options#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/breakfast_options").to route_to("breakfast_options#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/breakfast_options/1").to route_to("breakfast_options#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/breakfast_options/1").to route_to("breakfast_options#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/breakfast_options/1").to route_to("breakfast_options#destroy", :id => "1")
    end

  end
end
