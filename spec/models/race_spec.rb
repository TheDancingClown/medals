require 'rails_helper'

RSpec.describe Race, :type => :model do
  before(:each) do
    @race = Race.new(
      name: "London Marathon", 
      date: Date.new
    )
  end
  
  it "is valid with valid attributes" do
    expect(@race).to be_valid
  end
  it "is not valid without a name" do
    @race.name = nil
    expect(@race).to_not be_valid
  end
  it "is not valid without a date" do
    @race.date = nil
    expect(@race).to_not be_valid
  end

  describe "#slugify" do
    it "creates a url friendly race name" do
      @race.slugify
      expect(@race.slug).to eql "london-marathon"
    end
  end
end