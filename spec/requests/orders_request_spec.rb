require 'rails_helper'

RSpec.describe "Orders", type: :request do
  before(:each) do
    @runner = FactoryBot.create(:runner)
    @race = FactoryBot.create(:marathon)
  end

  describe "POST" do
    it "returns http success for valid params" do
      post "/api/v1/orders", params: { 
        order: { 
          runner_id: @runner.id, 
          race_id: @race.id
          }
        }
      expect(response).to have_http_status(200)
    end
    it "returns error for invalid params" do
      post "/api/v1/orders", params: { 
        order: { 
          runner_id: @runner.id, 
          race_id: nil
          }
        }
      expect(response).to have_http_status(422)
    end
  end

  describe "DELETE /:id" do
    it "returns http success" do
      order = Order.create(runner_id: @runner.id, race_id: @race.id)
      delete "/api/v1/orders/#{order.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
