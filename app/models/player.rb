class Player < ApplicationRecord
  validates :x, :y, :direction, presence: true

  DUNGEON_LAYOUT = [
  [0, 0, 0],
  [0, 1, 0],
  [0, 2, 0],
  [0, 0, 0]
].freeze

  DIRECTIONS = %w[north east south west].freeze

  def turn_left
    self.direction = DIRECTIONS[(DIRECTIONS.index(direction) - 1) % DIRECTIONS.size]
  end

  def turn_right
    self.direction = DIRECTIONS[(DIRECTIONS.index(direction) + 1) % DIRECTIONS.size]
  end

  def move_forward
    dx, dy = movement_delta
    new_x = x + dx
    new_y = y + dy
  
    puts "Current position: x=#{x}, y=#{y}, facing #{direction}"
    puts "Attempting move to: x=#{new_x}, y=#{new_y}"
  
    if valid_move?(new_x, new_y)
      self.x = new_x
      self.y = new_y
      save
      puts "Move successful: x=#{x}, y=#{y}"
    else
      puts "You can't move there!"
    end
  end

  def move_backward
    dx, dy = movement_delta
    new_x = x - dx
    new_y = y - dy
  
    if valid_move?(new_x, new_y)
      self.x = new_x
      self.y = new_y
      save
    else
      puts "You can't move there!"
    end
  end

  def movement_delta
    case direction
    when 'north' then [0, -1]
    when 'east'  then [1, 0]
    when 'south' then [0, 1]
    when 'west'  then [-1, 0]
    end
  end

  def valid_move?(new_x, new_y)
    # Check bounds of the array
    return false if new_y < 0 || new_y >= DUNGEON_LAYOUT.size
    return false if new_x < 0 || new_x >= DUNGEON_LAYOUT.first.size
  
    # Check if the target cell is walkable (not 0)
    DUNGEON_LAYOUT[new_y][new_x] != 0
  end

  def current_room
    room_id = DUNGEON_LAYOUT[y][x]
    Room.find_by(id: room_id) if room_id != 0
  end
end