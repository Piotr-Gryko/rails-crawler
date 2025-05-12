class RemoveImageColumnsFromRooms < ActiveRecord::Migration[8.0]
  def change
    remove_column :rooms, :north_image, :string
    remove_column :rooms, :south_image, :string
    remove_column :rooms, :east_image, :string
    remove_column :rooms, :west_image, :string
  end
end
