class CreateRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :rooms do |t|
      t.integer :x
      t.integer :y
      t.string :north_image
      t.string :south_image
      t.string :east_image
      t.string :west_image

      t.timestamps
    end
  end
end
