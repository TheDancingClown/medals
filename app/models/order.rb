class Order < ApplicationRecord
  belongs_to :race
  belongs_to :runner
  validates_presence_of :runner_id, :race_id
end
