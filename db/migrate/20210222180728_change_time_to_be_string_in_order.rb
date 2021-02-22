class ChangeTimeToBeStringInOrder < ActiveRecord::Migration[6.1]
  def up
    change_column :orders, :time, :string
  end

  def down
    change_column :orders, :time, :time
  end
end
