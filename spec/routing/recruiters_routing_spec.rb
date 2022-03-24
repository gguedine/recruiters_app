require "rails_helper"

RSpec.describe RecruitersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/recruiters").to route_to("recruiters#index")
    end

    it "routes to #show" do
      expect(get: "/recruiters/1").to route_to("recruiters#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/recruiters").to route_to("recruiters#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/recruiters/1").to route_to("recruiters#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/recruiters/1").to route_to("recruiters#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/recruiters/1").to route_to("recruiters#destroy", id: "1")
    end
  end
end
