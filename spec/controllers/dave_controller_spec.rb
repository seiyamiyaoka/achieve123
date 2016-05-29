require 'rails_helper'

RSpec.describe DaveController, :type => :controller do

  describe "GET dig" do
    it "returns http success" do
      get :dig
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET speak" do
    it "returns http success" do
      get :speak
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET teach" do
    it "returns http success" do
      get :teach
      expect(response).to have_http_status(:success)
    end
  end

end
