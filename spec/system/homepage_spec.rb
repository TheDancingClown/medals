require 'rails_helper'

RSpec.feature 'Homepage', type: :system, js: true do

  scenario 'The app opens to the Races homepage' do
    visit root_path
    expect(page).to have_content('Races')
  end
end
