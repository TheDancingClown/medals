class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def slugify
    self.slug = name.parameterize
  end
end
