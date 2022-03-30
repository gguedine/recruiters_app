require "rails_helper"

RSpec.describe API::Recruiters::SubmissionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "api/recruiters/submissions").to route_to(
"api/recruiters/submissions#index", format: :json
)
    end

    it "routes to #show" do
      expect(get: "api/recruiters/submissions/1").to route_to(
"api/recruiters/submissions#show", id: "1", format: :json
)
    end

    it "routes to #create" do
      expect(post: "api/recruiters/submissions").to route_to(
"api/recruiters/submissions#create", format: :json
)
    end

    it "routes to #update via PUT" do
      expect(put: "api/recruiters/submissions/1").to route_to(
"api/recruiters/submissions#update", id: "1", format: :json
)
    end

    it "routes to #update via PATCH" do
      expect(patch: "api/recruiters/submissions/1").to route_to(
"api/recruiters/submissions#update", id: "1", format: :json
)
    end

    it "routes to #destroy" do
      expect(delete: "/api/recruiters/submissions/1").to route_to(
"api/recruiters/submissions#destroy", id: "1", format: :json
)
    end
  end
end
