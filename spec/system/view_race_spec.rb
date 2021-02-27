require 'rails_helper'

RSpec.feature 'Race Page', type: :system, js: true do
  before(:each) do
    @marathon = FactoryBot.create(:marathon)
    @runner = FactoryBot.create(:runner)
    @order = Order.create({ runner: @runner, race: @marathon, name: 'Herbert', time: '4:15' })
  end

  scenario 'Visit the race page and see race data with orders' do
    visit "/races/#{@marathon.slug}"

    expect(page).to have_content(@marathon.name)
    expect(page).to have_content(@marathon.date)
    expect(page).to have_content("Order \##{@order.id}")
    expect(page).to have_content("Placed by #{@order.runner.name}")
  end
end