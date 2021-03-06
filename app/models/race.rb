class Race < ApplicationRecord
  has_many :orders
  has_many :runners, through: :orders
  validates_presence_of :name, :date

  before_create :slugify
  before_update :slugify

  private
  
  def slugify
    self.slug = name.parameterize
  end
end
