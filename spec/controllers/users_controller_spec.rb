require "rails_helper"

describe UsersController do
  describe "GET #show" do
    it "responds with status code 302" do
      get :show
      expect(response).to have_http_status 302
    end

    it "redirects to the pairings homepage" do
      get :show
      expect(response).to redirect_to pairings_path
    end
  end
end
