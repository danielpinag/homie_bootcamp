require 'rails_helper'
RSpec.describe ReportsController, type: :controller do
  describe "GET #info" do
    it "returns a success response" do
      get :info
      expect(response).to be_successful
    end
  end
end