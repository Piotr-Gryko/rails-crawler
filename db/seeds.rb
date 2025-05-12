Room.delete_all

DungeonLayout::LAYOUT.each_with_index do |row, y|
  row.each_with_index do |room_id, x|
    next if room_id == 0

    Room.find_or_create_by!(id: room_id, x: x, y: y)
  end
end
