require 'rails_helper'

RSpec.describe Runner, :type => :model do
  before(:each) do
    @runner = Runner.new(
      name: "Forrest Gump", 
      email: "run-forrest@run.com", 
      address: "Alabama"
    )
  end

  it "is valid with valid attributes" do
    expect(@runner).to be_valid
  end
  it "is not valid without a name" do
    @runner.name = nil
    expect(@runner).to_not be_valid
  end

  describe "#slugify" do
    it "creates a url friendly runner name" do
      @runner.slugify
      expect(@runner.slug).to eql "forrest-gump"
    end
  end
end