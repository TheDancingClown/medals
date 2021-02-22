class Runner < ApplicationRecord
  has_many :orders
  has_many :races, through: :orders
end
