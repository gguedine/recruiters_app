require "rails_helper"

RSpec.describe API::Public::SubmissionsController, type: :routing do
  describe "routing" do

    it "routes to #create" do
      expect(post: "/api/public/submission").to route_to("api/public/submissions#create", format: :json)
    end
  end
end
