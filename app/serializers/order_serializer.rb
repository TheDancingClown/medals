class OrderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :runner_id, :race_id, :name, :date, :time, :completed
end
