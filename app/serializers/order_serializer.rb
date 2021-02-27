class OrderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :runner, :race, :name, :date, :time, :completed
end
