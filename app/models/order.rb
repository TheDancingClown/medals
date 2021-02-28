class Order < ApplicationRecord
  belongs_to :race
  belongs_to :runner
  validates_presence_of :runner, :race
  before_create :set_completion

  private

  def set_completion
    self.completed = FALSE
  end
end
