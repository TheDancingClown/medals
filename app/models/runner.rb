class Runner < ApplicationRecord
  has_many :orders
  has_many :races, through: :orders
  validates_presence_of :name
end
