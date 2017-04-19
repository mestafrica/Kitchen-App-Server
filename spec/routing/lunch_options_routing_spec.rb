require "rails_helper"

RSpec.describe LunchOptionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/lunch_options").to route_to("lunch_options#index")
    end

    it "routes to #new" do
      expect(:get => "/lunch_options/new").to route_to("lunch_options#new")
    end

    it "routes to #show" do
      expect(:get => "/lunch_options/1").to route_to("lunch_options#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/lunch_options/1/edit").to route_to("lunch_options#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/lunch_options").to route_to("lunch_options#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/lunch_options/1").to route_to("lunch_options#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/lunch_options/1").to route_to("lunch_options#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/lunch_options/1").to route_to("lunch_options#destroy", :id => "1")
    end

  end
end
