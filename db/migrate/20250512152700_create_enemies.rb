class CreateEnemies < ActiveRecord::Migration[8.0]
  def change
    create_table :enemies do |t|
      t.integer :x
      t.integer :y
      t.string :name
      t.string :direction

      t.timestamps
    end
  end
end
