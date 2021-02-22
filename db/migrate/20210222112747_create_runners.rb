class CreateRunners < ActiveRecord::Migration[6.1]
  def change
    create_table :runners do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :slug

      t.timestamps
    end
  end
end
