require 'rails_helper'

RSpec.describe "Races", type: :request do
  before(:each) do
    @marathon = FactoryBot.create(:marathon)
  end

  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/races"

      expect(response).to have_http_status(200)
    end
  end

  describe "GET /:slug" do
    it "returns http success for correct path" do
      get "/api/v1/races/#{@marathon.slug}"

      expect(response).to have_http_status(200)
    end

    it "returns an error for incorrect path" do
      get "/api/v1/races/lon"

      expect(response).to have_http_status(404)
    end
  end

  describe "POST" do
    it "returns http success for valid params" do
      post "/api/v1/races", params: { 
        race: { 
          name: "Paris Marathon", 
          date: "2019-08-17" 
          }
        }

      expect(response).to have_http_status(200)
      expect(Race.find_by(name: 'Paris Marathon')).to be
      expect(Race.find_by(slug: 'paris-marathon')).to be
    end

    it "returns an error for invalid params" do
      post "/api/v1/races", params: { 
        race: { 
          name: "Paris Marathon" 
          }
        }

      expect(response).to have_http_status(422)
    end
  end

  describe "PATCH /:slug" do
    it "returns http success for valid params" do
      patch "/api/v1/races/#{@marathon.slug}", params: { 
        race: { 
          name: "Paris Marathon", 
          date: "2019-08-17"
          }
        }

      expect(response).to have_http_status(200)
      expect(Race.find_by(name: 'Paris Marathon')).to be
      expect(Race.find_by(slug: 'paris-marathon')).to be
    end

    it "returns an error for invalid params" do
      patch "/api/v1/races/#{@marathon.slug}", params: { 
        race: { 
          name: "Paris Marathon",
          date: nil
        }
      }

      expect(response).to have_http_status(422)
    end
  end

  describe "DELETE /:slug" do
    it "returns http success" do
      delete "/api/v1/races/#{@marathon.slug}"
      
      expect(response).to have_http_status(:success)
      expect(Race.find_by(name: 'London Marathon')).to_not be
    end
  end
end