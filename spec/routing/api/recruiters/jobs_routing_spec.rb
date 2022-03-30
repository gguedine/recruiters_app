require "rails_helper"

RSpec.describe API::Recruiters::JobsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "api/recruiters/jobs").to route_to(
"api/recruiters/jobs#index", format: :json
)
    end

    it "routes to #show" do
      expect(get: "api/recruiters/jobs/1").to route_to(
"api/recruiters/jobs#show", id: "1", format: :json
)
    end

    it "routes to #create" do
      expect(post: "api/recruiters/jobs").to route_to(
"api/recruiters/jobs#create", format: :json
)
    end

    it "routes to #update via PUT" do
      expect(put: "api/recruiters/jobs/1").to route_to(
"api/recruiters/jobs#update", id: "1", format: :json
)
    end

    it "routes to #update via PATCH" do
      expect(patch: "api/recruiters/jobs/1").to route_to(
"api/recruiters/jobs#update", id: "1", format: :json
)
    end

    it "routes to #destroy" do
      expect(delete: "api/recruiters/jobs/1").to route_to(
"api/recruiters/jobs#destroy", id: "1", format: :json
)
    end
  end
end
