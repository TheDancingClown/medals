class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.time :time
      t.date :date
      t.boolean :completed
      t.references :race, null: false, foreign_key: true
      t.references :runner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
