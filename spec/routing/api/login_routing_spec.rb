require "rails_helper"

RSpec.describe API::LoginController, type: :routing do
  describe "routing" do
    it "routes to #login" do
      expect(post: "/api/login").to route_to("api/login#login", format: :json)
    end

    it "routes to #auto_login" do
      expect(get: "/api/auto_login").to route_to("api/login#auto_login", format: :json)
    end
  end
end
