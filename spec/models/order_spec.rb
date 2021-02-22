require 'rails_helper'

RSpec.describe Order, :type => :model do

  before(:each) do
    @runner = FactoryBot.create(:runner)
    @race = FactoryBot.create(:race)
    @order = Order.new(
      race_id: @race.id, 
      runner_id: @runner.id
    )
  end

  it "is valid with valid attributes" do
    expect(@order).to be_valid
  end
  it "is not valid without a runner id" do
    @order.runner_id = nil
    expect(@order).to_not be_valid
  end
  it "is not valid without a race id" do
    @order.race_id = nil
    expect(@order).to_not be_valid
  end
end
