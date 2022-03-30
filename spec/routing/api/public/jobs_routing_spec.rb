require "rails_helper"

RSpec.describe API::Public::JobsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/public/jobs").to route_to("api/public/jobs#index",
                                                  format: :json)
    end

    it "routes to #show" do
      expect(get: "/api/public/jobs/1").to route_to("api/public/jobs#show",
                                                    id: "1", format: :json)
    end
  end
end
