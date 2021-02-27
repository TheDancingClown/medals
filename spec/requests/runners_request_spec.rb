require 'rails_helper'

RSpec.describe "Runners", type: :request do
  before(:each) do
    @runner = FactoryBot.create(:runner)
  end

  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/runners"
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /:id" do
    it "returns http success" do
      get "/api/v1/runners/#{@runner.id}"
      expect(response).to have_http_status(200)
    end

    it "returns an error for incorrect path" do
      get "/api/v1/runners/lon"
      expect(response).to have_http_status(404)
    end
  end

  describe "POST" do
    it "returns http success for valid params" do
      post "/api/v1/runners", params: { 
        runner: { 
          name: "Paula Radcliffe", 
          email: "paula@runner.co.uk" 
          }
        }
      expect(response).to have_http_status(200)
    end

    it "returns an error for invalid params" do
      post "/api/v1/runners", params: { 
        runner: { 
          name: "Paula Radcliffe" 
          }
        }
      expect(response).to have_http_status(422)
    end
  end

  describe "PATCH /:id" do
    it "returns http success for valid params" do
      patch "/api/v1/runners/#{@runner.id}", params: { 
        runner: { 
          name: "Paula Radcliffe", 
          email: "paula@runner.co.uk",
          address: "RU4 4ER"  
          }
        }
      expect(response).to have_http_status(200)
    end

    it "returns an error for invalid params" do
      patch "/api/v1/runners/#{@runner.id}", params: { 
        runner: { 
          name: "Paula Radcliffe",
          email: nil
        }
      }
      expect(response).to have_http_status(422)
    end
  end

  describe "DELETE /:id" do
    it "returns http success" do
      delete "/api/v1/runners/#{@runner.id}"
      expect(response).to have_http_status(:success)
    end
  end
end