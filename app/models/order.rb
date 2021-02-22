class Order < ApplicationRecord
  belongs_to :race
  belongs_to :runner
end
