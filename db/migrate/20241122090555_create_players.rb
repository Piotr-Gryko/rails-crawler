class CreatePlayers < ActiveRecord::Migration[8.0]
  def change
    create_table :players do |t|
      t.integer :x
      t.integer :y
      t.string :direction

      t.timestamps
    end
  end
end
