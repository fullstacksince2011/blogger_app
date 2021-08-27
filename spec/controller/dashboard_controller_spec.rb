
require 'rails_helper'
RSpec.describe DashboardController, :type => :controller do
  describe "GET index" do
    it "Should return 302(Redirect status response) if not login" do
      get :index
      expect(response.status).to eq(302)
    end

    it "Render index" do
      user = User.create!(email: "user@example.org", password: "very-secret")
      sign_in user
      get :index
      expect(response.status).to eq(200)
    end

  end
end