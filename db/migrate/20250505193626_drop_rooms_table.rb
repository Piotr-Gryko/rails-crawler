class DropRoomsTable < ActiveRecord::Migration[8.0]
  def up
    drop_table :rooms, if_exists: true
  end

  def down
    create_table :rooms do |t|
      t.string :name
      t.timestamps
    end
  end
end