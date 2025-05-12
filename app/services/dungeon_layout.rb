# app/services/dungeon_layout.rb
class DungeonLayout
  LAYOUT = [
    [ 6, 5 ],
    [ 4, 3 ],
    [ 2, 1 ],
  ].freeze

  def self.room_id_at(x, y)
    return nil if y < 0 || y >= LAYOUT.size || x < 0 || x >= LAYOUT.first.size

    LAYOUT[y][x]
  end

  def self.to_s
    LAYOUT.map do |row|
      row.map { |cell| cell == 0 ? '⬛' : cell.to_s.rjust(2) }.join(' ')
    end.join("\n")
  end
end
