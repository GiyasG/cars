require "rails_helper"

RSpec.describe CarpartsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/carparts").to route_to("carparts#index")
    end

    it "routes to #new" do
      expect(:get => "/carparts/new").to route_to("carparts#new")
    end

    it "routes to #show" do
      expect(:get => "/carparts/1").to route_to("carparts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/carparts/1/edit").to route_to("carparts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/carparts").to route_to("carparts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/carparts/1").to route_to("carparts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/carparts/1").to route_to("carparts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/carparts/1").to route_to("carparts#destroy", :id => "1")
    end

  end
end
