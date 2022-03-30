require "rails_helper"

RSpec.describe API::RecruitersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "api/recruiters").to route_to("api/recruiters#index",
                                                format: :json)
    end

    it "routes to #show" do
      expect(get: "api/recruiters/1").to route_to("api/recruiters#show",
                                                  id: "1", format: :json)
    end

    it "routes to #create" do
      expect(post: "api/recruiters").to route_to("api/recruiters#create",
                                                 format: :json)
    end

    it "routes to #update via PUT" do
      expect(put: "api/recruiters/1").to route_to("api/recruiters#update",
                                                  id: "1", format: :json)
    end

    it "routes to #update via PATCH" do
      expect(patch: "api/recruiters/1").to route_to("api/recruiters#update",
                                                    id: "1", format: :json)
    end

    it "routes to #destroy" do
      expect(delete: "api/recruiters/1").to route_to("api/recruiters#destroy",
                                                     id: "1", format: :json)
    end
  end
end
