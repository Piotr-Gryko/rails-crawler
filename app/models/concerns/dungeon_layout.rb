class DungeonLayout
  LAYOUT = [
    [ 6, 5 ],
    [ 4, 3 ],
    [ 2, 1 ]
  ].freeze

  ROOM_MOVEMENTS = {
    1 => %w[west],
    2 => %w[north east],
    3 => %w[west north],
    4 => %w[east north south],
    5 => %w[west south],
    6 => %w[east south]
  }

  STARTING_POSITION = [ 1, 2 ]

  def self.room_id_at(x, y)
    return nil if y < 0 || y >= LAYOUT.size || x < 0 || x >= LAYOUT.first.size

    LAYOUT[y][x]
  end

  def self.room_at(x, y)
    room_id = room_id_at(x, y)
    if room_id
      Room.find_by(id: room_id) # Fetch the room from the database
    else
      nil
    end
  end

  def self.to_s
    LAYOUT.map do |row|
      row.map { |cell| cell == 0 ? '⬛' : cell.to_s.rjust(2) }.join(' ')
    end.join("\n")
  end
end
