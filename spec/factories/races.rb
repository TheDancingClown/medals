FactoryBot.define do
  factory :marathon, class: 'Race' do
    name { "London Marathon" }
    date  { Date.new }
  end

  factory :half_marathon, class: 'Race' do
    name { "Brighton Half Marathon "}
    date { Date.new }
  end

end