Room.delete_all
Player.delete_all

layout = DungeonLayout::LAYOUT
room_movements = DungeonLayout::ROOM_MOVEMENTS
starting_position = DungeonLayout::STARTING_POSITION

layout.each_with_index do |row, y|
  row.each_with_index do |room_id, x|
    next if room_id == 0

    Room.create!(
      id: room_id,
      x: x,
      y: y,
      possible_moves: room_movements[room_id] || []
    )
  end
end

Player.create!(
  x: starting_position[0],
  y: starting_position[1],
  direction: 'west', # Starting direction (can be any)
)
