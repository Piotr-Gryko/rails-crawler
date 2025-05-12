Room.delete_all
Player.delete_all
Enemy.delete_all

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

puts "Rooms created!"

Player.create!(
  x: starting_position[0],
  y: starting_position[1],
  direction: 'west', # Starting direction (can be any)
)

puts "Player position set!"

# Add some example enemies
Enemy.create!(x: 0, y: 2, name: 'goblin', direction: 'north')
Enemy.create!(x: 1, y: 1, name: 'orc', direction: 'south')
Enemy.create!(x: 0, y: 0, name: 'dragon', direction: 'east')

puts "Enemies created!"
