require 'rails_helper'

RSpec.describe ReportsController, type: :routing do
  describe "routing" do
    it "routes to #info" do
      expect(get: "/reports/info").to route_to("reports#info")
    end
  end
end
