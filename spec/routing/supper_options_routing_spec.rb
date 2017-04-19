require "rails_helper"

RSpec.describe SupperOptionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/supper_options").to route_to("supper_options#index")
    end

    it "routes to #new" do
      expect(:get => "/supper_options/new").to route_to("supper_options#new")
    end

    it "routes to #show" do
      expect(:get => "/supper_options/1").to route_to("supper_options#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/supper_options/1/edit").to route_to("supper_options#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/supper_options").to route_to("supper_options#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/supper_options/1").to route_to("supper_options#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/supper_options/1").to route_to("supper_options#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/supper_options/1").to route_to("supper_options#destroy", :id => "1")
    end

  end
end
