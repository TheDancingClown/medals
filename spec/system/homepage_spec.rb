require 'rails_helper'

RSpec.feature 'Homepage', type: :system, js: true do
  before(:each) do
    @marathon = FactoryBot.create(:marathon)
    @half_marathon = FactoryBot.create(:half_marathon)
  end

  scenario 'Visit the home page and see races displayed with dates' do
    visit root_path

    expect(page).to have_content(@marathon.name)
    expect(page).to have_content(@marathon.date)
    expect(page).to have_content(@half_marathon.name)
    expect(page).to have_content(@half_marathon.date)
  end
end
