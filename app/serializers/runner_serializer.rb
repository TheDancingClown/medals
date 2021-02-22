class RunnerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :address, :slug

  has_many :orders
end
