class RaceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :date, :slug

  has_many :orders
end
