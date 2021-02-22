class Race < ApplicationRecord
  has_many :orders
  has_many :runners, through: :orders
  validates_presence_of :name
  validates_presence_of :date
end
