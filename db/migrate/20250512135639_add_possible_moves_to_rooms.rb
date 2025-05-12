class AddPossibleMovesToRooms < ActiveRecord::Migration[8.0]
  def change
    add_column :rooms, :possible_moves, :string
  end
end
