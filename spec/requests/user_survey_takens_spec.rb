require 'rails_helper'

RSpec.describe "UserSurveyTakens", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/user_survey_takens/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/user_survey_takens/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/user_survey_takens/index"
      expect(response).to have_http_status(:success)
    end
  end

end
