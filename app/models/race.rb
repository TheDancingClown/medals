class Race < ApplicationRecord
  has_many :orders
  has_many :runners, through: :orders
end
