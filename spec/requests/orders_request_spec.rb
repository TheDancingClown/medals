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
          race_id: @race.id,
          name: "Order owner",
          date: "2018-04-02",
          time: "04:12"
          }
        }

      expect(response).to have_http_status(200)
      expect(Order.find_by(name: "Order owner")).to be
      expect(Order.find_by(date: "2018-04-02")).to be
      expect(Order.find_by(time: "04:12")).to be
    end
    it "returns error for invalid params" do
      post "/api/v1/orders", params: { 
        order: { 
          runner_id: @runner.id, 
          race_id: nil,
          name: "Order owner",
          date: "2018-04-02",
          time: "04:12"
          }
        }

      expect(response).to have_http_status(422)
      expect(Order.find_by(name: "Order owner")).to_not be
    end
  end

  describe "DELETE /:id" do
    it "returns http success" do
      order = Order.create(runner_id: @runner.id, race_id: @race.id, name: "Order Owner")
      delete "/api/v1/orders/#{order.id}"

      expect(response).to have_http_status(:success)
      expect(Order.find_by(name: "order Owner")).to_not be
    end
  end
end
